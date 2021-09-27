#!/bin/bash
echo "Running Script"
cd
cd Desktop/Script\ for\ Auto\ Detect\ Monitor/

FILE=edid.dat
FILE2=output.txt

if test -f "$FILE"; then
	echo "$FILE exists."
	rm edid.dat
fi

if test -f "$FILE"; then
	echo "$FILE exists."
	rm output.txt
fi

DISPLAY=:0 xrandr --output HDMI-1 --rotate right
sleep 1

tvservice --device 2 -d edid.dat
edidparser edid.dat > output.txt
python3 CompareResults.py
COMPARE_RESULT=$?
echo "Compare result: ${COMPARE_RESULT}"
if [ $COMPARE_RESULT -eq 4 ]; then
	echo "Rotating Left"
	DISPLAY=:0 xrandr --output HDMI-1 --rotate left
else
	echo "Rotating Back to Normal"
	DISPLAY=:0 xrandr --output HDMI-1 --rotate normal
fi


