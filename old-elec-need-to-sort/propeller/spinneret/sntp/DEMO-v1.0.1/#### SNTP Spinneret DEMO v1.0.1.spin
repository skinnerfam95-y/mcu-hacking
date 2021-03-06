OBJ
{{
****************************************************************************
* SNTP (Simple Network Time Protocol) DEMO (build 09_08_2011) v1.0.1       *
* Author: Beau Schwabe                                                     *
*                                                                          *
* Recognition: Benjamin Yaroch, A.G.Schmidt (with help understanding SNTP) *
*                                                                          *
* Copyright (c) 2011 Parallax                                              *
* See end of file for terms of use.                                        *
****************************************************************************
}}
CON
{{
This DEMO program uses the internet SNTP to SYNC the internet time
with the built-in RTC on the Spinneret Web Server.

Revision History:
02-09-2011        - 'SNTP Spinneret DEMO v1.spin' release
09-08-2011        - optimized SNTP timeout for a more reliable server hit
                  - Added MAC ID validation (please play nice)
        
≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈
For this DEMO, only the 'Transmit Timestamp' is used ... for better
accuracy you need to implement the formula below.

      Timestamp Name          ID   When Generated
      ------------------------------------------------------------
      Originate Timestamp     T1   time request sent by client
      Receive Timestamp       T2   time request received at server
      Transmit Timestamp      T3   time reply sent by server
      Destination Timestamp   T4   time reply received at client

   The roundtrip delay d and local clock offset t are defined as

                       d = (T4 - T1) - (T2 - T3)
                    t = ((T2 - T1) + (T3 - T4)) / 2
}}

  _clkmode = xtal1 + pll16x
  _xinfreq = 5_000_000

  BUFFER_SIZE       = 2048
  
  socket            = 0
  
  TIME_PORT         = 123
  TIMEOUT_SECS      = 10

    'USA Standard Time Zone Abbreviations
 #-10, HST,AtST,PST,MST,CST,EST,AlST
              
    'USA Daylight Time Zone Abbreviations
  #-9, HDT,AtDT,PDT,MDT,CDT,EDT,AlDT

  Zone = CST  '<- Central Standard Time =  GMT-6

    'W5100 Interface
   #0, W5100_DATA0, W5100_DATA1, W5100_DATA2, W5100_DATA3, W5100_DATA4
   #5, W5100_DATA5, W5100_DATA6, W5100_DATA7, W5100_ADDR0, W5100_ADDR1
  #10, W5100_WR, W5100_RD, W5100_CS, W5100_INT, W5100_RST, W5100_SEN
      
VAR
  long  longHIGH,longLOW,MM_DD_YYYY,DW_HH_MM_SS 'Expected 4-contigous variables
  byte  Buffer[BUFFER_SIZE]
  
DAT
  'Set the values below to something meaningful for your LAN
  MACaddr         byte      $00, $08, $DC, $16, $F0, $20
  GatewayIP       byte      192, 168,   0,   1
  SubnetMask      byte      255, 255, 255,   0
  IP              byte      192, 168,   0,  55

  'Change this to a local SNTP (or other) TIME server in your region
  'Typically, the TIME server will report time in local time zone
  'For absolute time, this must be adjusted; for elapsed time it doesn't matter 
  timeIPaddr      byte       64, 147, 116, 229            
  
OBJ
  W5100  : "Brilldea_W5100_Indirect_Driver_Ver006"
  SNTP   : "SNTP Simple Network Time Protocol v1.0.1"
  RTC    : "s-35390A_GBSbuild_02_09_2011"
  PlxST  : "Parallax Serial Terminal"
  
PUB main | i
    RTC.start                     'Initialize On board Real Time Clock
    PlxST.Start(115_200)          'Initialize Parallax Serial Terminal
    
    ValidateMAC                   'Validate your Spinneret MAC address
    
'              Start up a cog dedicated to controlling the W5100
'≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈    
    W5100.StartINDIRECT(W5100_DATA0,{
                       }W5100_ADDR0,{
                       }W5100_ADDR1,{
                       }W5100_CS,   {
                       }W5100_RD,   {
                       }W5100_WR,   {
                       }W5100_RST,  {
                       }W5100_SEN)
                       
    W5100.InitAddresses(true, @MACaddr, @GatewayIP, @SubnetMask, @IP)

'   W5100.WriteMACaddress(true,@MACaddr)
'   W5100.WriteGatewayAddress(true, @GatewayIP)
'   W5100.WriteSubnetMask(true, @SubnetMask)
'   W5100.WriteIPAddress(true, @IP)

'                          Open UDP socket
'≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈
    W5100.SocketOpen(socket,W5100#_UDPPROTO,TIME_PORT,0,@IP)
    'check the status of the socket for connection and get internet time

    if ReadStatus(socket) == W5100#_SOCK_UDP
       PauseMSec(250)   '<-- Some Delay required here after socket connection
       if GetTime(0,@Buffer)

'                        Decode 64-Bit time from server           
'≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈       
          SNTP.GetTransmitTimestamp(Zone,@Buffer,@LongHIGH,@LongLOW)

'               Display Reference/Sync TimeZone corrected Time           
'≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈       
          DisplayHumanTime

'                         Set RTC to Internet Time          
'≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈
          RTC.SetDateTime(byte[@MM_DD_YYYY][3],   { <- Month
                        } byte[@MM_DD_YYYY][2],   { <- Day
                        } word[@MM_DD_YYYY][0]-2000,   { <- Year
                        } byte[@DW_HH_MM_SS][3],  { <- (day of week)
                        } byte[@DW_HH_MM_SS][2],  { <- Hour
                        } byte[@DW_HH_MM_SS][1],  { <- Minutes
                        } byte[@DW_HH_MM_SS][0])  { <- Seconds }

'                        Endless Loop to display RTC
'≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈≈                        
          repeat
            PlxST.Char(1)
            PlxST.str(RTC.FmtDateTime)

PUB GetTime(sockNum,BufferAddress)|i
    SNTP.CreateUDPtimeheader(BufferAddress,@timeIPaddr)

    repeat 10*TIMEOUT_SECS
      W5100.txUDP(sockNum, BufferAddress) '<-- Send the UDP packet
      i := W5100.rxUDP(sockNum,BufferAddress)  
      if i == 56
         W5100.SocketClose(sockNum)  '<-- At this point we are done, we have
                                    '     the time data and don't need to keep
                                    '     the connection active.
         return 1                   '<- Time Data is ready
      PauseMSec(100) '<- if 1000 = 1 sec ; 10 = 1/100th sec X 100 repeats above = 1 sec   
    return -1                       '<- Timed out without a response

PRI ReadStatus(socketNum) : socketStatus
    W5100.readIND((W5100#_S0_SR + (socketNum * $0100)), @socketStatus, 1)

PUB DisplayHumanTime
    PlxST.Char(13)
    PlxST.Char(13)
    PlxST.Char(13)
    PlxST.str(string("SNTP Server Sync time:",13))
    PlxST.str(string("(GMT "))
    if Zone<0
       PlxST.Char("-")
    else
       PlxST.Char("+")
    PlxST.str(string(" ",||Zone+48,":00) "))
    if byte[@MM_DD_YYYY][3]<10
       PlxST.Char("0")
    PlxST.dec(byte[@MM_DD_YYYY][3])
    PlxST.Char("/")
    if byte[@MM_DD_YYYY][2]<10
       PlxST.Char("0")
    PlxST.dec(byte[@MM_DD_YYYY][2])
    PlxST.Char("/")
    PlxST.dec(word[@MM_DD_YYYY][0])                    
    PlxST.Char(9)
    if byte[@DW_HH_MM_SS][2]<10
       PlxST.Char("0")
    PlxST.dec(byte[@DW_HH_MM_SS][2])
    PlxST.Char(":")
    if byte[@DW_HH_MM_SS][1]<10
       PlxST.Char("0")
    PlxST.dec(byte[@DW_HH_MM_SS][1])
    PlxST.Char(":")
    if byte[@DW_HH_MM_SS][0]<10
       PlxST.Char("0")
    PlxST.dec(byte[@DW_HH_MM_SS][0])
    PlxST.Char(13)

PRI PauseMSec(Duration)
''  Pause execution for specified milliseconds.
''  This routine is based on the set clock frequency.
''  
''  params:  Duration = number of milliseconds to delay                                                                                               
''  return:  none
  waitcnt(((clkfreq / 1_000 * Duration - 3932) #> 381) + cnt)

PRI ValidateMAC
    if long[@MACaddr][0] == $16DC0800 and word[@MACaddr][2] == $20F0
       repeat
         PlxST.Char(1)
         PlxST.str(string("Hey get your own MAC adress, this one is already in use!",13,13))
         PlxST.str(string("It's easy, look on the bottom of your Spinneret in the white box",13))
         PlxST.str(string("and enter those numbers into this program in the first DAT section",13))         
         PlxST.str(string("with the comment... ",13,13))
         PlxST.str(string(" 'Set the values below to something meaningful for your LAN" ,13))         
   


OBJ
{{
┌───────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                     TERMS OF USE: MIT License                                     │                                                            
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│Permission is hereby granted, free of charge, to any person obtaining a copy of this software and  │
│associated documentation files (the "Software"), to deal in the Software without restriction,      │
│including without limitation the rights to use, copy, modify, merge, publish, distribute,          │
│sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is      │
│furnished to do so, subject to the following conditions:                                           │
│                                                                                                   │
│The above copyright notice and this permission notice shall be included in all copies or           │
│ substantial portions of the Software.                                                             │
│                                                                                                   │
│THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT  │
│NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND             │
│NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,       │
│DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,                   │
│ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE        │
│SOFTWARE.                                                                                          │     
└───────────────────────────────────────────────────────────────────────────────────────────────────┘
}}