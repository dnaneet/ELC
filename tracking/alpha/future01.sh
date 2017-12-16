#!/bin/bash


clear
# Function to center text on screen.  Centering conforms to terminal window size.
echo_c()
{
  w=$(stty size | cut -d" " -f2)       # width of the terminal
  l=${#1}                              # length of the string
  printf "${GREEN}%"$((l+(w-l)/2))"s\n" "$1"   # print string padded to proper width (%Ws)
}


echo_c "***************************************************"
echo_c "  _____ _     _____  "
echo_c " |  ___| |   /  __ \ "
echo_c " | |__ | |   | /  \/ "
echo_c " |  __|| |   | |     "
echo_c " | |___| |___| \__/\ "
echo_c " \____/\_____/\____/ "
echo_c "***************************************************"
echo_c "Welcome to the Engineering Learning Center"
echo_c "This is the new 'ELC usage' data collector"
echo_c "Service selection screen will load in 5 seconds"
echo_c "***************************************************"




for i in `seq 1 5`; do
    sleep 1
    echo_c "__x**x__"
done



cmd=(dialog --separate-output --checklist "Select your service/course:" 22 76 16)
options=(1 "Statics (MEEM 2110)" off    # any option can be set to default to "on"
         2 "Mechanics of Matls. (MEEM 2150)" off
         3 "Dynamics (MEEM 2700)" off
         4 "ETF-1 (MEEM 2201)" off
		 5 "MATLAB help" off
		 6 "Study space" off
		 7 "If you wish to provide feedback" off)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            echo "You selected Statics"
	    	sleep 2s
            ;;
        2)
            echo "You selected Mechanics of Matls."
	    	sleep 2s
            ;;
        3)
            echo "You selected Dynamics"
	    	sleep 2s
            ;;
        4)
            echo "You selected ETF-1"
	    	sleep 2s
            ;;
		5)
            echo "You selected MATLAB help"
	    	sleep 2s
            ;;
		6)
            echo "You selected Study Space"
	    	sleep 2s
            ;;
		7)
			echo "Feedback screen will load shortly. Please follow the instructions"
			echo 5s
			./user_input.sh
			;;
    esac       
done

if [ -z "$choice" ]
	then
	   echo "Nothing was selected! Please make a choice."
fi
