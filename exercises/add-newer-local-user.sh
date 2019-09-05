#!/bin/bash

# This scripts improves on the previous version by only displaying
# the info needed to be sent at the end. It also displays all error msgs on STDERR

if [[ "${UID}" -ne 0 ]]
then
  echo 'You are not running with superuser privileges. Exiting.' >&2
  exit 1
fi

# Enter the username
if [[ "${#}" -lt 1 ]]
then
  echo "Usage ${0} USER_NAME [COMMENT]..."
  echo 'Create an account on the local system with the name of USER_NAME and comments in the field COMMENT' >&2
  exit 1
fi

USER_NAME=${1}
shift
COMMENT=${@}

# Generate password
PASSWORD=$(date +%s%N | sha256sum | head -c48)

# Create user
useradd -c "${COMMENT}" -m ${USER_NAME} &> /dev/null

# Check return status

if [[ ${?} -ne 0 ]]
then
  echo 'Account could not be created' >&2
  exit 1
fi

# Enter the password
usermod --password $(echo ${PASSWORD} | openssl passwd -1 stdin) ${USER_NAME} &> /dev/null


#check if password command succeeded

if [[ ${?} -ne 0 ]]
then
  echo 'The password for the account could not be set' >&2
  exit 1
fi

# Force password reset
passwd -e ${USER_NAME}

# Display username, password and  host info
echo 'username:'
echo ${USER_NAME}
echo
echo 'password:'
echo ${PASSWORD}
echo
echo 'host:'
echo ${HOSTNAME}

