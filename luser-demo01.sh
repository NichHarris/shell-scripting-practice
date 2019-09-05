#!/bin/bash

# This script displays various information to the screen

# Display 'Hello'
echo 'Hello'

# Assign a value to a variable
WORD='script'

# Display that value using the variable
echo "$WORD"

# Show single quotes show exactly what is specified

echo '$WORD'

# combine the variable with a hard-coded text

echo "This is a shell $WORD"

# Dispplay the contents of the variable using an alternative syntax
echo "This is a shell ${WORD}"

# Append text to the variable
echo "${WORD}ing is fun!"

# Create a new variable
ENDING='ed'

# Combine variables
echo "This is ${WORD}${ENDING}."

# Change the value stored in the ENDING variable (Reassignment)

ENDING='ing'

echo "${WORD}${ENDING} is fun!"

ENDING='s'

echo "You are going to write so many ${WORD}${ENDING} in this class"
