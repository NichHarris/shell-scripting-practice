#1/bin/bash

# This script will create new user accounts

# Executed with superuser privileges
if [[ "${UID}" -ne 0 ]]
then
  echo 'You are not running with superuser privileges. Exiting.'
  exit 1
fi

# Enter the username
read -p 'Enter the username: ' USER_NAME

# Enter the name
read -p 'Enter the name of the account holder: ' COMMENT

read -p 'Enter password for account holder: ' PASSWORD
# Create new user
useradd -c "${COMMENT}" -m ${USER_NAME}

# Enter the password
sudo passwd ${USER_NAME}

if [[ ${?} -ne 0 ]]
then
  echo 'The password for the account could not be set'
  exit 1
fi
# Display username, password and  host info
echo "Account username:\n${USER_NAME}\nPassword:\n${PASSWORD}\nHost:\n${HOSTNAME}"

