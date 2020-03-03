#!/bin/bash

myUserID=`logname`

serverName=`hostname`

usernames=`last | cut -c1-9 | sed '$d' | sed '1d' | sed '$d' |sed -e "s/[ /t]*$//"| sort -u| uniq | tr "\n" ","  | tr " " ", " | sed "s/,$//"`

numberOfUsers=`last | cut -c1-9 | sed '$d' | sed '1d' | sed '$d' | sort -u| uniq | wc -l`

IPAddress=`hostname -I | cut -c12-24`

OperatingSystem=`hostnamectl | grep "Operating Sys" | sed -e "s/://"` 

NumberofLogins=`last | grep $myUserID | wc -l`

UserLoginDate=`last | grep "begins" | cut -c12-22 | sed -e "s/  / /"`

clear
echo ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo This is machine $serverName.
echo "$numberOfUsers users have currently logged into $serverName since $UserLoginDate; they are:"
echo $usernames.
echo $serverName is at IP Address $IPAddress and is running$OperatingSystem.
echo You are $myUserID, and you have logged in $NumberofLogins times since$UserLoginDate.
echo ------------------------------------------------------------------------------------------------------------------------------------------------------------------------
