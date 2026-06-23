#!/bin/bash

read -r -p "Enter Number :" NUM

if [ -n "$NUM -gt 0" ]
then 
	echo "number is positive"
	exit 1
fi

if [ -n "$NUM -lt 0" ]
then
	echo "number is negative"
	exit 1
else
	echo "number is zero"
fi