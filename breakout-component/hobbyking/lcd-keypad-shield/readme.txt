The LCD Keypad shield is developed for Arduino compatible boards, to provide a user-friendly interface that allows users to go through the menu, make selections etc. It consists of a 1602 white character blue backlight LCD. The keypad consists of 5 keys — select, up, right, down and left. To save the digital IO pins, the keypad interface uses only one ADC channel. The key value is read through a 5 stage voltage divider.
Note: Version 1.1 main updates are the button values, which have being updated on the example code. For older version check the comments and edit, or use the Enhanced V1.0 library 

Pin	Function
Analog 0	Button (select, up, right, down and left)
Digital 4	DB4
Digital 5	DB5
Digital 6	DB6
Digital 7	DB7
Digital 8	RS (Data or Signal Display Selection)
Digital 9	Enable
Digital 10	Backlit Control

Note on I2C example
This library inherits LiquidCrystal and adds another method: button - to read button pushed on a keypad. This works on the Old version of the board V1.0

http://www.dfrobot.com/wiki/index.php?title=Arduino_LCD_KeyPad_Shield_(SKU:_DFR0009)
http://www.shieldlist.org/dfrobot/lcd

Arduino lib examples
The key grab does not work, but the number guess does