#!/bin/bash

# This script send last n photos to jhony's PC.

user='jhony'
nn='1'
path='/storage/0895-8522/DCIM/Camera'
port='22'

print_usage(){
  printf "Usage: $0 [-n value] [-u user] [-d path] [-p port] <ip_address>"
}

error_integer(){
  echo 'Error in -n argument: Must be an integer equal or greater than 1.
Exiting...'
  exit 1
}

print_help(){
printf "This script send last n photos to jhony\'s PC. Uses scp to send files to the other PC and requires an IP address.
  Options:
      -n   Number of files to send. Default value is 1.
      -u   Username. Dafault value is 'jhony'
      -d   Directory where search. Default value is '$path'
      -p   Port of destiny. Default value is 22.
      "
}

# Checking if receive arguments
if [[ $# -eq 0 ]] ; then
  echo 'Error: IP address nor options received.'
  print_usage
  exit 1
fi

# Reading arguments with flags
while getopts 'n:p:u:d:h' flag; do
  case "${flag}" in
    n) nn="${OPTARG}"
       ;;
    u) user="${OPTARG}"
       ;;
    d) path="${OPTARG}"
       ;;
    p) port="${OPTARG}"
       ;;
    h | help) 
       print_help
       print_usage
       exit 0
       ;;
    *) print_usage
       exit 1
       ;;
  esac
done

# Checking order: mandatory argument (address) must be unique
shift $((OPTIND-1))
if [[ $# > 1 ]] ; then
  printf "Error: Incorrect order or many arguments.\n"
  print_usage
  exit 1
fi

# Checking value of -n argument
if ! [[ "$nn" =~ ^[0-9]+$ ]]
  then error_integer
else
  if [[ "$nn" < 1 ]]
    then error_integer
  fi
fi

# Searching for file(s)
#path="/home/jhony/playground/dir4"
files=$(exa --sort=mod --reverse $path | head -n$nn | xargs printf "$path/%s\n")
echo "Sending $nn files to $user host:"
echo "$files"
$(scp -P $port $files $user@$1:photos/)

