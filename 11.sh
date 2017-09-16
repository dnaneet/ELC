#!/bin/bash

clear 
timestamp() {
  date +"%T"
}

echo_c()
{
  w=$(stty size | cut -d" " -f2)       # width of the terminal
  l=${#1}                              # length of the string
  printf "%"$((l+(w-l)/2))"s\n" "$1"   # print string padded to proper width (%Ws)
}

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



ts=$(timestamp)
echo_c ""
echo_c "--------------------"
echo_c "The current time is"  
echo_c $ts
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

echo_c "$REPLY" >> somefile, timestamp
printf '%s\n' $REPLY  $ts | paste -sd ',' >> file.csv

            if [ "$REPLY" = "6" ]; then
                echo_c "Your entry has been recorded as STUDY SPACE.  This page will reload in 4 seconds for the next user."
                sleep 4s
            elif [ "$REPLY" = "5" ]; then
                echo_c "Your entry has been recorded as MATLAB HELP. This page will reload in 4 seconds for the next user."
                sleep 4s
            elif [ "$REPLY" = "4" ]; then
                echo_c "Your entry has been recorded as DYNAMICS HELP. This page will reload in 4 seconds for the next user."
                sleep 4s 
            elif [ "$REPLY" = "3" ]; then
                echo_c "Your entry has been recorded as ETF-1 HELP. This page will reload in 4 seconds for the next user."
                sleep 4s                               
            elif [ "$REPLY" = "2" ]; then
                echo_c "Your entry has been recorded as MECHANICS OF MATERIALS HELP. This page will reload in 4 seconds for the next user."
                sleep 4s            
            elif [ "$REPLY" = "1" ]; then
                echo_c "Your entry has been recorded as STATICS HELP. This page will reload in 4 seconds for the next user."
                sleep 4s           
             else
                echo_c "You entered an incorrect option. This page will reload in 4 seconds for the next user."
                sleep 4s            
            fi

echo_c -en "\ec"

./11.sh
