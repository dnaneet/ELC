#!/bin/bash
#''''''''''''''''''''''''''''''''''''''''''''#
#26-November-2017
#
#Author: Aneet Naredranath, PhD
#
#This is an initial bash script that could be used to back-up data from [local] to [remote].  Here, [local] is $HOME/test while remote is /home/campus16/dnaneet.
#
#The next version of this bash script would allow for syncing of data between the Raspberry Pi based CLI deployed in the ELC [could be local/remote] with the ELC coordinator's home directory [could be local/remote]
#
#'''''''''''''''''''''''''''''''''''''''''''#

rsync -avz $HOME/test dnaneet@login.me.mtu.edu:/home/campus16/dnaneet/

