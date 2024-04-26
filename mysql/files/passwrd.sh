#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 "
    exit 1
fi

mysql -u danielgetahun46 <<EOF
ALTER USER 'danielgetahun46'@'localhost' IDENTIFIED BY '$password';
FLUSH PRIVILEGES;
EOF

if [ $? -eq 0 ]; then
    echo "password updated successfully."
else
    echo "Error: Failed to update password."
fi
