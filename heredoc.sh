#!/usr/bin/env bash
#
# Heredoc is very useful to write multi-lines block
#
# Syntax of Heredoc
# command << DELIMITER
# Line-1
# Line-2
# DELIMITER
#
# DELIMITER can be any STRING
# Normally DELIMITER is ued with CAT command
#
cat << EOF
The logged in user is: $USER
The hostname is: $(hostname)
The current working directory is: $(pwd)
Current logged in users are: $(w)
EOF

# We can redirect Heredoc output to file
cat << EOF > userinfo.log
The logged in user is: $USER
The hostname is: $(hostname)
The current working directory is: $(pwd)
Current logged in users are: $(w)
EOF

# We can output Heredoc to another command
echo "Heredoc with grep"
cat << EOF | grep -iE "working|this"
The logged in user is: $USER
This hostname is: $(hostname)
The current working directory is: $(pwd)
Current logged in users are: $(w)
EOF
