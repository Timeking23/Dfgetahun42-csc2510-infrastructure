#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <new_password>"
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
