#!/bin/bash

file=$(date +"%b").txt
if [ -e "$file" ]; then
    echo "File exists"
else 
    echo "File does not exist"
    touch $(date +"%b").txt
    echo "File $(date +"%b").txt created"
fi 

touch $(date +"%b-%d-%y").csv
