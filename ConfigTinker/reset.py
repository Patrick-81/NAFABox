#!/usr/bin/env python3

################################################
# Under GPL license
#     https://www.gnu.org/licenses/gpl.html
# Authors:	kbahey
# 			
# On Dec 14 2018
# V0.1
################################################
import time
import serial

# configure the serial connections (the parameters differs on the device you are connecting to)
ser = serial.Serial(port='/dev/ttyUSB0', baudrate=9600)

ser.isOpen()

def serial_send(s):
	string = s.encode('utf-8')
	ser.write(string)
	time.sleep(0.05)

serial_send(':GVN#')
ser.close()
