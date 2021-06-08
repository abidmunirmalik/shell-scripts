#!/usr/bin/env bash
#
: """
Syntax of Case:
case $variable in
     option1)
             statement
             ;;
     option2)
             statement
             ;;
           *)
             statement
             ;;
esac
"""

# Exercise: Guess number
read -p "Enter number between 1 - 5: " n
case $n in
  1)
    echo "your number 1" 
    ;;
  2)
    echo "your number 2"
    ;;
  3)
    echo "your number 3"
    ;;
  4)
    echo "your number 4"
    ;;
  5)
    echo "your number 5"
    ;;
  *)
    echo "number not between 1 and 5"
    exit 100
    ;;
esac


# Excercise - find best actor
tarzen() { echo "Tarzen...."; }
superman() { echo "Superman...."; }
spiderman() { echo "Spiderman...."; }
captain() { echo "Captain America...."; }

echo "1 - Tarzen."
echo "2 - Superman."
echo "3 - Spiderman."
echo "4 - Captain America."

read -p "What is your favorite character? " actor
case $actor in
  1) tarzen ;;
  2) superman ;;
  3) spiderman ;;
  4) captain ;;
  *) echo "No one ?....";;
esac

# Excercise: find birth year
echo "[What is your Birth Year]"
current_year=$(date +"%Y")
read -p "How old are you? " age
birth_year=$((current_year - age))
echo "Were you born in $birth_year or $((birth_year - 1))?"
