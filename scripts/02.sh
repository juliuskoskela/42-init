#!/bin/bash
read -p "Enter the user you want to delete: " NAME
sudo killall -u $NAME
sleep 2
sudo deluser --remove-home $NAME%
