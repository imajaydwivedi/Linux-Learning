#!/bin/bash
host=`hostname`
myage=30
echo Enter your name
read name
echo "Please enter your age"
read myage

echo "Welcome $name on $host host"

if (( myage >= 30 ))
#if [ $myage -ge 30 ]
then
  echo "You are old"
else
  echo "You are young"
fi

# if profile file exists, then existing user
profile="/tmp/$name.profile"
echo $profile

#if [ -e "$profile" ]
if [ -f "$profile" ]
then echo "You are existing user"
else
  echo "You are a new user"
  echo "Let's create your profile '$profile'"
  touch $profile
fi

