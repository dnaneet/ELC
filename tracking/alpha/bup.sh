#!/bin/bash
#''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#
#This bash script uploads daily collected data to an ELC
#dropbox folder.  It needs the dropbox uploader script
#that is available from Andrea Fabrizi's git
#
#This script is/needs to be scheduled through cron
#
#Author: Aneet Narendranath, PhD
#Ver :1.0
#Date:09-December-2017
#
#'''''''''''''''''''''''''''''''''''''''''''''''''''''''

if [ -e $(date +"%B-%d-%Y").csv ] #Check of today's csv file exists
   then
	/home/pi/Downloads/./dropbox_uploader.sh upload ./$(date +"%B-%d-%Y").csv /ELC/
else
	exit 0
fi
#$(date +"%B-%d-%Y").csv
