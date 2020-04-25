#!/bin/bash
# for removing PosManip effects

for g in Army Navy AirForce
    do
    for u in {1..50}
        do
        n=$(sudo ls /home/$g$u | grep -c 'position_allotted.txt')
		if [[ $n -eq 1 ]]
		then
        	sudo rm /home/$g$u/position_allotted.txt
        fi
    done
done

