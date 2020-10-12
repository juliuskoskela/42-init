#!/bin/bash
read -p "Input: " input1
read -p "Input: " input2
echo $input1
echo $input2
$input1 | grep "$input2" | grep -m1 -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"
