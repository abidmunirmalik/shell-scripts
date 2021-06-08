#!/usr/bin/env bash
: """
A function is a block of code that performs a specific task
Functions reduces the code length
We have to define the function before calling it
No need to put () after function call
We can define function as:
function function_name {
}
OR
function_name() {
}
"""
tput clear
echo "---------------"
echo " CALCULATION   "
echo "---------------"

function user_input(){
 read -p "Enter first number: " num1
 read -p "Enter second number: " num2
}

function addition() {
 result=$((num1+num2))
 echo "The addition of $num1 & $num2 is: $result"
}

function subtraction() {
 result=$((num1-num2))
 echo "The subtraction of $num1 & $num2 is: $result"
}
function multiplication() {
 result=$((num1*num2))
 echo "The multiplication of $num1 & $num2 is: $result"
}
function division() {
 result=$((num1/num2))
 echo "The division of $num1 & $num2 is: $result"
}
echo -e "[a]ddition\n[b]Subtraction\n[c]Multiplication\n[d]Division\n"
read -p "Enter your choice: " choice

case $choice in
  [aA]) user_input; addition;;
  [bB]) user_input; subtraction;;
  [cC]) user_input; multiplication;;
  [dD]) user_input; division;;
  *)  echo "wrong choice"; exit 1 ;;
esac

<< VARIABLE_SCOPE
A variable can have two scopes:
Global
Local
By default variables are Global in scope
VARIABLE_SCOPE

# We are defining function before declare variable
function display_name() {
 city="Raleigh"
 echo $name
}
name="Abid Malik"
display_name
echo "${name} lives in ${city}"

# since shell read line-by-line from top-to-botom
# It will read name="shell scripting" and then will call function
# so for function, name variable has already been defined with default scope of GLOBAL

# Defining 'local scope' variables
# When we define variable with 'local' keyword within function, it is not visible outside
# 'local' can only be used in a function

function print_name(){
 local my_name="John Doe"
}
echo "Name is: ${my_name}"

# Returning a value from function
function return_a_value() {
 local l_num=100
# return ${l_num}
 local l_name="Sheena Doe"
 echo $l_name
}
#return_a_value
#echo "function's local variable name: $?"
n=$(return_a_value)
echo "name is: $n"

# Passing parameters to functions
function addnumbers() {
 echo "command-line argumnents: $@"
 echo "Arguments passed: $#"
 [[ $# -eq 2 ]] && echo "Arguments requirement met" || echo "2 args needed"; exit 2
 return $(($1+$2))
}
addnumbers 2 4 4
echo "Sum of 2 and 4: $?"
