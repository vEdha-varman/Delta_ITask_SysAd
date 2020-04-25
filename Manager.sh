#!/bin/bash
# to add aliases and run them



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

chmod 755 FinAttManip
alias finalattendance="./FinAttManip"

chmod 755 NearManip
alias nearest="./NearManip"


shopt -s expand_aliases
source ~/.bashrc
# . ~/.bash_aliases


echo -e "\nInitiating User Generation ..."
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
for u in ArmyGeneral NavyMarshal AirForceChief
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

# -------- > for finalattendance, nearest
loc_file=$(locate FinAttManip)
sudo touch ~ChiefCommander/.SHINIT
echo 'alias finalattendance='\"\\\"$loc_file\\\"\" | sudo tee -a ~ChiefCommander/.SHINIT >/dev/null 2>&1
echo 'ENV=$HOME/.SHINIT; export ENV' | sudo tee -a ~ChiefCommander/.profile >/dev/null 2>&1
sudo chmod 755 ~ChiefCommander/.SHINIT
sudo setfacl -m u:ChiefCommander:rx -R "$loc_file"
# --------
echo "Checking Final Attendance ..."
finalattendance
echo "... Checked"

# ---- > for nearest
loc_file=$(locate NearManip)
sudo touch ~ChiefCommander/.SHINIT
echo 'alias nearest='\"\\\"$loc_file\\\"\" | sudo tee -a ~ChiefCommander/.SHINIT >/dev/null 2>&1
echo 'ENV=$HOME/.SHINIT; export ENV' | sudo tee -a ~ChiefCommander/.profile >/dev/null 2>&1
sudo chmod 755 ~ChiefCommander/.SHINIT
sudo setfacl -m u:ChiefCommander:rx -R "$loc_file"
# ----
echo "Gathering Report for Nearest Postings ..."
nearest
echo "... Nearest Report Gathered"



echo -e "\n.. Over and Out."
