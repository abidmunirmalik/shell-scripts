#!/usr/bin/env bash

# exit out if wget is not installed
if ! which wget 1>/dev/null 2>/dev/null; then
 echo"wget is not installed!"
 exit 1
fi

# check for existance of index.html
if [[ -e index.html ]]; then
 /usr/bin/rm -f index.html
fi 

function download_file() {
 url="https://mirrors.edge.kernel.org/pub/software/scm/git/"
 /usr/bin/wget $url 1>/dev/null 2>/dev/null
}


function process_file() {
 sed -i '/git-\([0-9]\+\.\)\+tar.gz/!d' index.html 
 declare -a git_versions
 git_versions+=($(cat index.html | awk -F '"' '{print $2}' | cut -c 5- | awk -F ".tar.gz" '{print $1}'))
 echo "[Git versions]"
 cnt=0
 length=${#git_versions[*]}
 WIDTH=10
 for version in ${git_versions[*]} ; do
  #echo -e "${git_versions[$cnt]} \\t ${git_versions[$((cnt+1))]} \\t ${git_versions[$((cnt+2))]} \\t ${git_versions[$((cnt+3))]}"
  printf "%- *s %- *s %- *s\n" $WIDTH ${git_versions[$cnt]} $WIDTH ${git_versions[$((cnt+1))]} $WIDTH ${git_versions[$((cnt+2))]}
  cnt=$((cnt+3))
  if [[ $cnt -ge $length ]]; then
   break
  fi
 done
}

download_file
[[ -e index.html ]] && process_file || echo "error downloading file from $url" ; exit 2
