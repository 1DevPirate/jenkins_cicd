#!/bin/bash

# Ask the user a question
echo "Do you want to go to jail, or do you want to go home?"
read response

if [ "$response" = 'home' ] || [ "$response" = 'yes' ]; then
  echo "Glad you want to go home."
  echo "Aight, I got you."

  # Install apache2
  sudo apt install apache2

  # Install mysql
  sudo apt install mysql-server

  # Install postgres
  sudo apt install postgresql

  # Additional commands or actions can be added here
else
  echo "You made a different choice."
  # Add actions for the alternative choice if needed
fi

