#include "Charliplexing.h"
#include "Myfont.h"
#include "Arduino.h"
#include <EEPROM.h>

int toggleState;
int EEPROMaddress = 0;
int charLength=0;
unsigned char textIN[]="Jimmie Rodgers is: IN";
unsigned char textOUT[]="Jimmie Rodgers is: OUT";

void setup(){
  LedSign::Init();
  toggleState = EEPROM.read(EEPROMaddress);
  if (0==toggleState){
    charLength=22;
    EEPROM.write(EEPROMaddress, 1);
  }
  else if (1==toggleState){
    charLength=23;
    EEPROM.write(EEPROMaddress, 0);
  }
  else{
    EEPROM.write(EEPROMaddress, 1);
  }
}

void loop(){
  if (0==toggleState) Myfont::Banner(charLength,textIN);
  else if (1==toggleState) Myfont::Banner(charLength,textOUT);
}
