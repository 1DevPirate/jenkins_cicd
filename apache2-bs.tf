#!/bin/bash

while true; do
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

    break  # Exit the loop if the user makes a valid choice
  else
    echo "Invalid response. Please enter 'home' or 'yes'."
  
fi
