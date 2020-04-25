#!/bin/bash


loc_file=$(locate AttendManip.sh)
nl=$(cat /etc/crontab | grep -c 'AttendManip.sh')
if [[ $nl -eq 0 ]]
then
	echo "0  6  * * * $user "\"\\\"$loc_file\\\"\" | sudo tee -a /etc/crontab >/dev/null 2>&1
fi


Date=$(date +"%F")

sudo touch /home/ArmyGeneral/attendance_record.txt
echo "$Date:" | sudo tee -a /home/ArmyGeneral/attendance_record.txt >/dev/null 2>&1
grep -i "$Date.* Army" attendance.log | awk '{if ( $3 == "YES" ) print "\t"$2}' | sudo tee -a /home/ArmyGeneral/attendance_record.txt >/dev/null 2>&1

sudo touch /home/NavyMarshal/attendance_record.txt
echo "$Date:" | sudo tee -a /home/NavyMarshal/attendance_record.txt >/dev/null 2>&1
grep -i "$Date.* Navy" attendance.log | awk '{if ( $3 == "YES" ) print "\t"$2}' | sudo tee -a /home/NavyMarshal/attendance_record.txt >/dev/null 2>&1

sudo touch /home/AirForceChief/attendance_record.txt
echo "$Date:" | sudo tee -a /home/AirForceChief/attendance_record.txt >/dev/null 2>&1
grep -i "$Date.* AirForce" attendance.log | awk '{if ( $3 == "YES" ) print "\t"$2}' | sudo tee -a /home/AirForceChief/attendance_record.txt >/dev/null 2>&1
