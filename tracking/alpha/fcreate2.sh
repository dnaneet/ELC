#!/bin/bash

#This bash script checks to see if a file by the name "MON.txt" exists.  If not, it creates the file.  
#Example: If Sep.txt exists, nothing happens.  If Sep.txt does not exist, then an empty file viz., Sep.txt
#is created

file=$(date +"%b").txt
if [ -e "$file" ]; then
 echo " "
else 
    touch /home/dnaneet/Desktop/$(date +"%b").txt
fi 

#touch $(date +"%b-%d-%y").csv
