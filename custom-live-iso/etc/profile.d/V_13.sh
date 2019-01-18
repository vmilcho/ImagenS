#!/bin/bash

var_001="Tadeo"
var_002="pikachu"
var_003=$(zenity 2>/dev/null --entry --title="Clave de encriptacion" --text="Por favor introduzca la clave para la encriptacion:" --hide-text)

printf "%s\n%s\n%s\n%s\n" $var_001 $var_002 $var_003 $var_003 | sudo -kS cryptsetup luksChangeKey /dev/sda5

echo $var_001 | sudo -kS sed -i s/AutomaticLogin/#AutomaticLogin/ /etc/gdm3/custom.conf

echo $var_001 | sudo -kS sed -i s/"so obscure"/"so"/ /etc/pam.d/common-password

echo $var_001 | sudo -kS sed -i s/"so sha512"/"so sha512 minlen=1"/ /etc/pam.d/common-password

var_004=$(zenity 2>/dev/null --entry --title="Clave de cuenta personal" --text="Por favor introduzca la clave para su cuenta personal:" --hide-text)

printf "%s\n%s\n%s\n" $var_001 $var_004 $var_004 | passwd

echo $var_004 | sudo -kS rm /etc/profile.d/V_13.sh

var_005=$(awk -F'[/:]' '{if ($3 >= 1000 && $3 != 65534) print $1}' /etc/passwd)

echo $var_004 | sudo -kS deluser $var_005 sudo

history -c

shutdown -r now



