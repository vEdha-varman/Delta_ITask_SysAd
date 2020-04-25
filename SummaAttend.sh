#!/bin/bash
# for removing AttendManip effects

Date=$(date +"%F")

n=$(sudo ls /home/ArmyGeneral | grep -c 'attendance_record.txt')
if [[ $n -eq 1 ]]
then
	sudo rm /home/ArmyGeneral/attendance_record.txt
fi

n=$(sudo ls /home/NavyMarshal | grep -c 'attendance_record.txt')
if [[ $n -eq 1 ]]
then
	sudo rm /home/NavyMarshal/attendance_record.txt
fi

n=$(sudo ls /home/AirForceChief | grep -c 'attendance_record.txt')
if [[ $n -eq 1 ]]
then
	sudo rm /home/AirForceChief/attendance_record.txt
fi

