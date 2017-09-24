#!/bin/bash

#
#
# The following bash script converts the .xlsx files to .csv.  The same file name is retained.
# The spreadsheet application ssconvert, that is part of "gnumeric" is utlized in performing this conversion.
#
# The following computer program may be distributed under "Attribution-NonCommercial 4.0 International (CC BY-NC 4.0)" 
# https://creativecommons.org/licenses/by-nc/4.0/
#
# Author: Aneet D.Narendranath, PhD.
#
# Version: 1.0  Date: 24-September-2017
#
for i in *.xlsx; 
   do
      y=$(basename "$i" xlsx.csv)
      z=$(basename "$y" .xlsx)	      
      echo $z
      ssconvert "$i" "$z".csv ; 
   done
