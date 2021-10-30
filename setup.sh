#!/bin/bash
info=$(curl -s https://api.github.com/repos/adafruit/Adafruit_CircuitPython_Bundle/releases/latest | grep adafruit-circuitpython-bundle-7.x-mpy)
zip_file=$(echo $info | grep name | cut -d \" -f 4)
download_url=$(echo $info | grep download_url | cut -d \" -f 8)
folder_name="${zip_file%.*}"
if [ ! -d "$folder_name" ];
then
	if [ ! -f "$download_url" ];
    then
        wget $download_url
    fi
    unzip $zip_file
fi

if [ ! -d "./pico-ducky/lib/adafruit_hid" ];
then
    cp -r "./$folder_name/lib/adafruit_hid" ./pico-ducky/lib
fi

