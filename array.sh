#!/usr/bin/env bash
# Index Based Arrays
declare cmdArray
cmdArray=(hostname pwd date whoami)
echo "[Total elements of array]"
echo ${#cmdArray[@]}
echo "[index values of array]"
echo ${!cmdArray[@]}
echo "[last element of array]"
echo ${cmdArray[-1]}
for command in ${cmdArray[@]}; do
 echo [$command]
 echo `$command`
done

# Associate Arrays
<<ARRAY
Arrays with index values as srings
Generally, no need to define index-based arrays before using them
Associative arrays must be declared before using them
declare -a ar
ar=(2 4 6)
declare -A ass
ARRAY
declare -A ass
ass[service]="docker" 
ass[version]=12.9.3
echo "${ass[service]} has version of ${ass[version]}"

# Example of Associative array
declare -A userdata
userdata[name]=amalik
userdata[password]=8eab04lec
echo "${userdata[name]} has password of ${userdata[password]}"
echo "[All values of Associative array]"
echo ${userdata[*]}
echo "[All keys]"
for key in "${!userdata[@]}"; do echo $key; done
echo "[All values]"
for val in "${userdata[@]}"; do echo $val; done
echo "[key vlaues]"
for key in "${!userdata[@]}"; do echo "$key - ${userdata[$key]}"; done
unset "userdata[*]"
