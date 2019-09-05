#!/bin/bash

# This script generates a list of random passwords

# A random number as a password 

PASSWORD=${RANDOM}
echo ${RANDOM}

# Three random numbers all together

PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo ${PASSWORD}

# Use current date/time as the basis for password
PASSWORD=$(date +%s)
echo ${PASSWORD}

# Now improve the security of the  password use nanoseconds
PASSWORD=$(date +%s%N)
echo ${PASSWORD}

# Now encrypt it with sha256
PASSWORD=$(date +%s | sha256sum)
echo ${PASSWORD}

# Now select X amount of unit of that data
PASSWORD=$(date +%s | sha256sum | head -c8)
echo ${PASSWORD}

# Even better password
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c12)
echo ${PASSWORD}

# Append a special character

SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"

