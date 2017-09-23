#!/bin/bash

# Function that creates a time stamp
#clear 
#timestamp() {
#  date +"%T"
#}
clear
# Function to center text on screen.  Centering conforms to terminal window size.
echo_c()
{
  w=$(stty size | cut -d" " -f2)       # width of the terminal
  l=${#1}                              # length of the string
  printf "%"$((l+(w-l)/2))"s\n" "$1"   # print string padded to proper width (%Ws)
}

#Colour information
#RED='\033[0;31m'
#NC='\033[0m' # No Color

echo_c "  _____ _     _____  "
echo_c " |  ___| |   /  __ \ "
echo_c " | |__ | |   | /  \/ "
echo_c " |  __|| |   | |     "
echo_c " | |___| |___| \__/\ "
echo_c " \____/\_____/\____/ "
echo_c "***************************************************"
echo_c "Welcome to the Engineering Learning Center"
echo_c "The data you enter helps us understand ELC usage"
echo_c "***************************************************"



#ts=$(timestamp) #If you activate this line, make sure to also uncomment the function timestamp in the first few lines of code.

#The following lines of code display user input options for different subject-help offered at the ELC
echo_c ""
echo_c "--------------------"
echo_c "The current time is"  
echo_c $(date +"%H:%M")
echo_c "--------------------"
echo_c "The current date is"
echo_c $(date +"%b-%d-%y")
echo_c "--------------------"
echo_c ""
echo_c "For Statics (MEEM 2110), enter 1"
echo_c "For Mechanics of materials (MEEM 2150), enter 2"
echo_c "For Thermodynamics/ETF-1 (MEEM 2201), enter 3"
echo_c "For Dynamics (MEEM 2700), enter 4"
echo_c "For MATLAB help, enter 5"
echo_c "For study space, enter 6"
echo_c "........................."
echo_c "Enter your choice and then press the RETURN key: "
read -p " "

#echo_c "$REPLY" >> somefile, timestamp
#printf '%s\n' $REPLY $(date +"%B") $(date +"%d") $(date +"%A") $ts | paste -sd ',' >> file.csv
#printf '%s\n' $REPLY $(date +"%B") $(date +"%d") $(date +"%A") $(date +"%H") | paste -sd ',' >> file.csv

# The current Month (%B=Month), date (%d=date), day (%A=day) and hour (%H=hour) are appended to the file with file name Month-date-year.csv

file=$(date +"%B-%d-%Y").csv
if [ -e "$file" ]; then
 echo " "
else 
    touch ./$(date +"%B-%d-%Y").csv
fi 

#printf '%s\n' "subject" "Month" "day" "date" "Hour" | paste -sd ',' >> $(date +"%B-%d-%Y").csv
            if [ "$REPLY" = "6" ]; then
                echo_c "Your entry has been recorded as STUDY SPACE.  This page will reload in 4 seconds for the next user."
		sleep 2s
            elif [ "$REPLY" = "5" ]; then
                echo_c "Your entry has been recorded as MATLAB HELP. This page will reload in 4 seconds for the next user."
		sleep 2s
            elif [ "$REPLY" = "4" ]; then
                echo_c "Your entry has been recorded as DYNAMICS HELP. This page will reload in 4 seconds for the next user."
		sleep 2s 
            elif [ "$REPLY" = "3" ]; then
                echo_c "Your entry has been recorded as ETF-1 HELP. This page will reload in 4 seconds for the next user."
		sleep 2s                               
            elif [ "$REPLY" = "2" ]; then
                echo_c "Your entry has been recorded as MECHANICS OF MATERIALS HELP. This page will reload in 4 seconds for the next user."
		sleep 2s            
            elif [ "$REPLY" = "1" ]; then
                echo_c "Your entry has been recorded as STATICS HELP. This page will reload in 4 seconds for the next user."
		sleep 2s           
             else
                echo_c "You entered an incorrect option. This page will reload in 4 seconds for the next user."
                sleep 2s            
            fi

#Appends Month, date, day, hour to Month-date-year.csv.  A new csv is created every day.
printf '%s\n' $REPLY $(date +"%B") $(date +"%d") $(date +"%A") $(date +"%H") | paste -sd ',' >> $(date +"%B-%d-%Y").csv

#Appends Month, date, year, day, hour to DATA.csv
printf '%s\n' $REPLY $(date +"%B") $(date +"%d") $(date +"%Y") $(date +"%A") $(date +"%H") | paste -sd ',' >> DATA.csv
echo_c -en "\ec"

#./15.sh
