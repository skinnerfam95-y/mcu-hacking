/* 


This file was dynamically created by the Lol Shield Theatre: http://falldeaf.com/lolshield/
Feel free to drop by and create your own cinema masterpiece :)

-falldeaf


Animation information - 
///////////////////////// 
//title: Dancing Man 
//author: SoulFinder 
//description:  a dance party 
///////////////////////// 
//current score: 9 (as of Tuesday 16th of July 2013 06:02:58 PM ) 
//animation page at: http://falldeaf.com/lolshield/show.php?anim=338 
///////////////////////// 

 This program is a modification of the Basic LoL Shield Test
 
 Modified by falldeaf on 2/27/2011.
 
 Writen for the LoL Shield, designed by Jimmie Rodgers:
 http://jimmieprodgers.com/kits/lolshield/
 
 This needs the Charliplexing library, which you can get at the
 LoL Shield project page: http://code.google.com/p/lolshield/
 
 Created by Jimmie Rodgers on 12/30/2009.
 Adapted from: http://www.arduino.cc/playground/Code/BitMath
 
 History:
  	December 30, 2009 - V1.0 first version written at 26C3/Berlin

  This is free software; you can redistribute it and/or
  modify it under the terms of the GNU Version 3 General Public
  License as published by the Free Software Foundation; 
  or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

*/ 

#include <Charliplexing.h> //Imports the library, which needs to be

byte line = 0;       //Row counter
char buffer[10];
int value;

void setup() 
{
  LedSign::Init();  //Initializes the screen
}

void loop()
{

	delay(200);
	DisplayBitMap(112);
	DisplayBitMap(80);
	DisplayBitMap(368);
	DisplayBitMap(160);
	DisplayBitMap(112);
	DisplayBitMap(40);
	DisplayBitMap(84);
	DisplayBitMap(80);
	DisplayBitMap(80);
	delay(200);
	DisplayBitMap(112);
	DisplayBitMap(80);
	DisplayBitMap(116);
	DisplayBitMap(40);
	DisplayBitMap(112);
	DisplayBitMap(160);
	DisplayBitMap(336);
	DisplayBitMap(80);
	DisplayBitMap(80);
	delay(200);
	DisplayBitMap(112);
	DisplayBitMap(80);
	DisplayBitMap(112);
	DisplayBitMap(32);
	DisplayBitMap(508);
	DisplayBitMap(32);
	DisplayBitMap(80);
	DisplayBitMap(80);
	DisplayBitMap(80);
	delay(200);
	DisplayBitMap(112);
	DisplayBitMap(80);
	DisplayBitMap(116);
	DisplayBitMap(40);
	DisplayBitMap(368);
	DisplayBitMap(160);
	DisplayBitMap(80);
	DisplayBitMap(144);
	DisplayBitMap(272);
	delay(200);
	DisplayBitMap(112);
	DisplayBitMap(80);
	DisplayBitMap(112);
	DisplayBitMap(32);
	DisplayBitMap(508);
	DisplayBitMap(32);
	DisplayBitMap(80);
	DisplayBitMap(80);
	DisplayBitMap(80);
	delay(200);
	DisplayBitMap(112);
	DisplayBitMap(80);
	DisplayBitMap(368);
	DisplayBitMap(160);
	DisplayBitMap(116);
	DisplayBitMap(40);
	DisplayBitMap(80);
	DisplayBitMap(72);
	DisplayBitMap(68);
	delay(200);
	DisplayBitMap(112);
	DisplayBitMap(80);
	DisplayBitMap(112);
	DisplayBitMap(36);
	DisplayBitMap(376);
	DisplayBitMap(160);
	DisplayBitMap(80);
	DisplayBitMap(80);
	DisplayBitMap(80);
	delay(200);
	DisplayBitMap(112);
	DisplayBitMap(80);
	DisplayBitMap(112);
	DisplayBitMap(32);
	DisplayBitMap(116);
	DisplayBitMap(168);
	DisplayBitMap(336);
	DisplayBitMap(144);
	DisplayBitMap(272);
	delay(200);
	DisplayBitMap(224);
	DisplayBitMap(160);
	DisplayBitMap(224);
	DisplayBitMap(64);
	DisplayBitMap(736);
	DisplayBitMap(344);
	DisplayBitMap(160);
	DisplayBitMap(288);
	DisplayBitMap(272);
	delay(200);
	DisplayBitMap(448);
	DisplayBitMap(320);
	DisplayBitMap(448);
	DisplayBitMap(128);
	DisplayBitMap(1488);
	DisplayBitMap(672);
	DisplayBitMap(320);
	DisplayBitMap(288);
	DisplayBitMap(272);
	delay(200);
	DisplayBitMap(448);
	DisplayBitMap(320);
	DisplayBitMap(448);
	DisplayBitMap(128);
	DisplayBitMap(976);
	DisplayBitMap(1184);
	DisplayBitMap(320);
	DisplayBitMap(320);
	DisplayBitMap(288);
	delay(200);
	DisplayBitMap(896);
	DisplayBitMap(640);
	DisplayBitMap(896);
	DisplayBitMap(128);
	DisplayBitMap(2000);
	DisplayBitMap(160);
	DisplayBitMap(320);
	DisplayBitMap(320);
	DisplayBitMap(320);
	delay(200);
	DisplayBitMap(896);
	DisplayBitMap(640);
	DisplayBitMap(896);
	DisplayBitMap(1152);
	DisplayBitMap(992);
	DisplayBitMap(144);
	DisplayBitMap(320);
	DisplayBitMap(640);
	DisplayBitMap(320);
	delay(200);
	DisplayBitMap(896);
	DisplayBitMap(640);
	DisplayBitMap(896);
	DisplayBitMap(128);
	DisplayBitMap(1472);
	DisplayBitMap(672);
	DisplayBitMap(448);
	DisplayBitMap(384);
	DisplayBitMap(384);
	delay(200);
	DisplayBitMap(0);
	DisplayBitMap(448);
	DisplayBitMap(320);
	DisplayBitMap(448);
	DisplayBitMap(1168);
	DisplayBitMap(992);
	DisplayBitMap(128);
	DisplayBitMap(384);
	DisplayBitMap(1632);
	delay(200);
	DisplayBitMap(0);
	DisplayBitMap(0);
	DisplayBitMap(448);
	DisplayBitMap(320);
	DisplayBitMap(1488);
	DisplayBitMap(672);
	DisplayBitMap(448);
	DisplayBitMap(128);
	DisplayBitMap(1904);
	delay(200);
	DisplayBitMap(0);
	DisplayBitMap(448);
	DisplayBitMap(320);
	DisplayBitMap(448);
	DisplayBitMap(128);
	DisplayBitMap(2032);
	DisplayBitMap(128);
	DisplayBitMap(864);
	DisplayBitMap(1040);
	delay(200);
	DisplayBitMap(0);
	DisplayBitMap(448);
	DisplayBitMap(320);
	DisplayBitMap(448);
	DisplayBitMap(1152);
	DisplayBitMap(1008);
	DisplayBitMap(128);
	DisplayBitMap(864);
	DisplayBitMap(1040);
	delay(200);
	DisplayBitMap(0);
	DisplayBitMap(448);
	DisplayBitMap(320);
	DisplayBitMap(448);
	DisplayBitMap(640);
	DisplayBitMap(1520);
	DisplayBitMap(128);
	DisplayBitMap(864);
	DisplayBitMap(1040);
	delay(200);
	DisplayBitMap(0);
	DisplayBitMap(448);
	DisplayBitMap(320);
	DisplayBitMap(448);
	DisplayBitMap(160);
	DisplayBitMap(2000);
	DisplayBitMap(128);
	DisplayBitMap(864);
	DisplayBitMap(1040);
	delay(200);
	DisplayBitMap(0);
	DisplayBitMap(448);
	DisplayBitMap(320);
	DisplayBitMap(448);
	DisplayBitMap(144);
	DisplayBitMap(992);
	DisplayBitMap(1152);
	DisplayBitMap(864);
	DisplayBitMap(1040);
	delay(200);
	DisplayBitMap(448);
	DisplayBitMap(320);
	DisplayBitMap(448);
	DisplayBitMap(1168);
	DisplayBitMap(992);
	DisplayBitMap(128);
	DisplayBitMap(320);
	DisplayBitMap(544);
	DisplayBitMap(1040);
	delay(200);
	DisplayBitMap(224);
	DisplayBitMap(160);
	DisplayBitMap(224);
	DisplayBitMap(64);
	DisplayBitMap(504);
	DisplayBitMap(576);
	DisplayBitMap(160);
	DisplayBitMap(272);
	DisplayBitMap(528);
	delay(200);
	DisplayBitMap(112);
	DisplayBitMap(80);
	DisplayBitMap(112);
	DisplayBitMap(32);
	DisplayBitMap(496);
	DisplayBitMap(40);
	DisplayBitMap(84);
	DisplayBitMap(144);
	DisplayBitMap(272);
	delay(200);
	DisplayBitMap(112);
	DisplayBitMap(80);
	DisplayBitMap(368);
	DisplayBitMap(160);
	DisplayBitMap(112);
	DisplayBitMap(40);
	DisplayBitMap(84);
	DisplayBitMap(80);
	DisplayBitMap(144);

}

void DisplayBitMap(int lineint)
{
  //int data[9] = {95, 247, 123, 511, 255, 1, 5, 31, 15};
  
  //for(line = 0; line < 9; line++) {
  for (byte led=0; led<14; ++led) {
    if (lineint & (1<<led)) {
      LedSign::Set(led, line, 1);
    } else {
      LedSign::Set(led, line, 0);
    }
  }
    
  line++;
  if(line >= 9) line = 0;
}