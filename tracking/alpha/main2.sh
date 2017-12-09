#!/bin/bash
#Main file that runs data collection code 15.sh in an infinite loop

function ctrl_c() {
        clear
	echo "** Trapped CTRL-C0"
	sleep 1s
	echo "'''''''''''''''''''''''''''''''''''''''"
        echo "Enter Admin password and click [ENTER]: "
        read passPhrase
        if [ $passPhrase == "Suvicat" ]; then
                echo "Suvi! It's you!"
                for i in `seq 1 5`; do
                    sleep 1
                    echo -n "."
                    #pkill 23.sh
                    #pkill main.sh
                done
	  	pkill main.sh
        else
                echo "Incorrect pass phrase.  'Service Selection' screen will in 5 seconds load"
		for i in `seq 1 5`; do
		    sleep 1
		   echo -n "."
		done
                #./23.sh
        fi
}


trap ctrl_c INT


while :
do
	./23.sh
done
