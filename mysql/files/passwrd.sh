#!/bin/bash

read -sp "Enter the new password for the MySQL root user: " password
echo ""

if [ -z "$password" ]; then
    echo "Error: Password not provided."
    exit 1
fi

mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$password';
FLUSH PRIVILEGES;
EOF

if [ $? -eq 0 ]; then
    echo "Root user's password updated successfully."
else
    echo "Error: Failed to update root user's password."
fi
