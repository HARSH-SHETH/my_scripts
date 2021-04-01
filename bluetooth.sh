#!/bin/bash

mac_address=FC:58:FA:84:CA:23

echo -e "connect $mac_address"

if [ $1 == '--yes' ] || [ $1 == '-y' ]
then
    echo -e "connect $mac_address\n" | bluetoothctl 
elif [ $1 == ' ' ] || [ $1 == '--no' ] || [ $1 == '-n' ] 
then
    echo -e "disconnect\n" | bluetoothctl
else
   echo -e "fuck u bitch\n"
fi
