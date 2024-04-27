#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <password>"
    exit 1
fi

password="$1"

mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$password';
FLUSH PRIVILEGES;
EOF

if [ $? -eq 0 ]; then
    echo "Password updated successfully."
else
    echo "Error: Failed to update password."
fi
