#!/usr/bin/env bash
<< SED
sed is stream editor
sed performs functions on files like view, replace, rename, insert or delete etc
sed is also used to 'cat' file
sed is used to search a string from a file and also supports regular expression
sed read line-by-line, execute sed commands, and display result to output stream
syntax:
 sed [options] commands [file]
SED
echo "[sed with no options & commands on a file]"
echo "[-n option is must to use when using 'p']"
#sed '' users.txt
sed -n 'p' users.txt
echo ""
echo "[print last line]"
sed -n '$p' users.txt

echo ""
echo "[print first 2 lines]"
sed -n '1,2p' users.txt

echo ""
echo "[print from line 3 till end]"
sed -n '3,$p' users.txt

echo ""
echo "[print from line 2 to line 4]"
sed -n '2,+4p' users.txt

echo ""
echo "[print odd lines]"
sed -n '1~3p' users.txt

echo ""
echo "[print even lines]"
sed -n '1~2p' users.txt

echo ""
echo "[delete last line]"
sed '$d' users.txt  > users2.txt

echo ""
echo "[delete from 1 to 3rd line]"
sed '1,3d' users.txt

echo ""
echo "[don't delete from 3rd to last line]"
sed '3,$!d' users.txt

echo ""
echo "[delete 1 to 3rd line and save the file]"
sed -i '1,3d' users2.txt

echo ""
echo "[delete last line]"
sed '$d' /tmp/passwd

echo ""
echo "[delete lines where name is Josh]"
sed "/Josh/d" users.txt

echo ""
echo "[Don't delete lines with name Abid, but delete all others]"
sed '/Abid/!d' users.txt

echo ""
echo "[backup the file before deleting]"
sed -i.bak '1,$d' users2.txt

# Searching with sed
echo "[Search josh from the file]"
sed -n "/Josh/p" users.txt

# echo "[Search multiple strings, use -e option]"
sed -n -e "/Josh/p" -e "/Abid/p" users.txt
grep -iE "abid|josh" users.txt

# Replace text with sed
# s=substitue, i=replace file, g=globally, I=case-insenstive
echo "[replace root with reeta in /tmp/passwd file]"
sed  -i 's/ROOT/reeta/gI' /tmp/passwd
echo ""
echo "[change shell to 'zsh' for user 'platdeploy']"
cat /tmp/passwd | grep -i platdeploy | sed 's/bash/zsh/'
echo ""
echo "[change 2nd occurance of 'daemon' to 'deeman']"
sed 's/daemon/deeman/2' /tmp/passwd | grep daemon
echo ""
echo "[using sed, change false to true for mysql]"
sed '/mysql/s/false/true/gI' /tmp/passwd
# or only one occurance
sed '/mysql/s/FALSE/true/I' /tmp/passwd

# How to insert or delete using sed
echo "[Insert a line before line number 5]"
sed -i '5i 35,Joosh Plumber,Goat123, bash' users.txt
echo ""
echo "[Insert a line after line number 6]"
sed -i '6a 55,Jeena Doe,Peak123, bash' users.txt

echo ""
echo "[Insert a line after first and last line]"
sed -i '1a ---------------------------' users.txt
sed -i '$a ---------------------------' users.txt

echo ""
echo "[Insert a line after platdeploy]"
sed '/platdeploy/a -----------\nEnd of file' /tmp/passwd

echo ""
echo "[Find all lines with space]"
sed -n '/\s/p' users.txt

echo ""
echo "[Find all lines with no space]"
sed -n '/\s/!p' users.txt

echo ""
echo "[Find all lines with tab space]"
sed -n '/\t/p' users.txt

echo ""
echo "[Find word start with space and j, end with spae]"
sed -n '/\sj..i\s/p' users.txt

echo ""
echo "[Find all line with dot]"
sed -n '/\./p' users.txt

echo ""
echo "[Find all jan or jani or janii]"
sed -n '/jani*/p' users.txt
# at least one time i
sed -n '/jani\+/p' users.txt
# zero or one time
sed -n '/jani\?\s/p' users.txt

echo ""
echo "[find lines starting with 40]"
grep "^40" users.txt
sed -n '/^40/p' users.txt

echo ""
echo "[find lines end with zsh]"
sed -n '/zsh$/p' users.txt
grep 'zsh$' users.txt

echo ""
echo "[delete all empty lines]"
sed -i '/^$/d' users.txt

echo ""
echo "[The [] matches any single character in list]"
sed -n '/J[aeiou]/p' users.txt

echo ""
echo "[The {} matches for required number of repetations]"
echo "[print any line that has three sss in it]"
sed -n '/This\{3,\}\b/p' users.txt

eho ""
echo "[The () will search for zero or more whole sequence$]"
echo "print lines that has 'asdf' word three times like asfdasdfasdf]"
sed -n '/\(asdf\)\{3\}/p' users.txt
sed -n '/get-\([0-9]\+\.\)+tar.gz/p' users.txt
# git-2.43.1.tar.gz
