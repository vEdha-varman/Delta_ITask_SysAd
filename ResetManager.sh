#!/bin/bash


for u in ChiefCommander ArmyGeneral NavyMarshal AirForceChief
do
    sudo userdel -r $u
    sudo passwd -l $u
done

for g in Army Navy AirForce
do
	for u in {1..50}
	do
    	sudo userdel -r $g$u
    	sudo passwd -l $g$u
    done
    
    sudo groupdel $g
done

