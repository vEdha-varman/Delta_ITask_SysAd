#!/bin/bash
# to add aliases and run them

# touch ~/.bash_aliases


echo "Starting .."
sudo updatedb


user=$(whoami)

chmod 755 UserManip.sh
alias userGenerate="./UserManip.sh"

chmod 755 PermitManip.sh
alias permit="./PermitManip.sh"

chmod 755 PosManip.sh
alias autoSchedule="./PosManip.sh"

chmod 755 AttendManip.sh
alias attendance="./AttendManip.sh"

chmod 755 RecordManip
alias record="./RecordManip"

# chmod 755 FinAttManip.sh
# alias finalattendance="./FinAttManip.sh"


shopt -s expand_aliases
source ~/.bashrc
# . ~/.bash_aliases


echo "Initiating User Generation ..."
userGenerate
echo "... Users Created"

echo "Granting Permissions ..."
permit
echo "... Permissions Granted"

echo "Assignment of Scheduled Positions ..."
autoSchedule
echo "...Positions are Set (Auto-Scheduled) ..."

echo "Attendance Reports are being Updated ..."
attendance
echo "... Updation of Attendance - Done"

# ---- > for records to work
loc_file=$(locate RecordManip)
for u in ArmyGeneral NavyMarshal AirForceChief ChiefCommander
	do
	sudo touch /home/$u/.SHINIT
	echo 'alias record='\"\\\"$loc_file\\\"\" | sudo tee -a /home/$u/.SHINIT >/dev/null 2>&1

	echo 'ENV=$HOME/.SHINIT; export ENV' | sudo tee -a /home/$u/.profile >/dev/null 2>&1
	
	sudo chmod 755 /home/$u/.SHINIT
	
	sudo setfacl -m u:$u:rx -R "$loc_file"
done
# ----
echo "Checking Records 4 ..."
record 4
echo "... Records Checked"


# finalattendance


# echo "0  9  * * * $user finalattendance" | sudo tee -a /etc/crontab >/dev/null 2>&1
# echo "0  9  * * * $user nearest" | sudo tee -a /etc/crontab >/dev/null 2>&1

echo ".. Over and Out."
