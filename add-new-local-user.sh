#!/bin/bash

# This script will automatically generate a password for a profile

if [[ "${UID}" -ne 0 ]]
then
  echo 'You are not running with superuser privileges. Exiting.'
  exit 1
fi

# Enter the username
if [[ "${#}" -lt 1 ]]
then
  echo "Usage ${0} USER_NAME [COMMENT]..."
  echo 'Create an account on the local system with the name of USER_NAME and comments in the field COMMENT'
  exit 1
fi

USER_NAME=${1}
shift

COMMENT=${@}

PASSWORD=$(date +%s%N | sha256sum | head -c48)

useradd -c "${COMMENT}" -m ${USER_NAME}

# Check return status

if [[ ${?} -ne 0 ]]
then
  echo 'Account could not be created'
  exit 1
fi

# Enter the password
usermod --password $(echo ${PASSWORD} | openssl passwd -1 stdin) ${USER_NAME}
#sudo passwd ${USER_NAME}
#echo ${PASSWORD}


#check if password command succeeded

if [[ ${?} -ne 0 ]]
then
  echo 'THe password for the account could not be set'
  exit 1
fi

# Display username, password and  host info
echo
echo 'username:'
echo ${USER_NAME}
echo
echo 'password:'
echo ${PASSWORD}
echo
echo 'host:'
echo ${HOSTNAME}
