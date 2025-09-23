#!/bin/bash

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "Please run this script as root or with sudo."
   exit 1
fi

echo "Creating users with home directories..."
useradd -m Bob
useradd -m Sally
useradd -m Larry

echo "Setting passwords for users (default: password123)..."
echo "Bob:password123" | chpasswd
echo "Sally:password123" | chpasswd
echo "Larry:password123" | chpasswd

echo "Creating group 'coders' and adding users to it..."
groupadd coders
usermod -aG coders Bob
usermod -aG coders Sally
usermod -aG coders Larry

echo "Creating file 'prac6.txt'..."
touch prac6.txt

echo "Changing ownership of 'prac6.txt' to Larry and group coders..."
chown Larry:coders prac6.txt

echo "Setting sticky bit on prac6.txt (note: sticky bit has no effect on regular files)..."
chmod +t prac6.txt

echo "Creating folder 'prac6'..."
mkdir prac6

echo "Creating folder 'prac5' (if it doesn't exist)..."
mkdir -p prac5

echo "Giving Sally and Larry access to 'prac5' using ACL..."
setfacl -m u:Sally:rwx prac5
setfacl -m u:Larry:rwx prac5

echo "Acting as Sally to create a file in 'prac5'..."
sudo -u Sally touch prac5/sally_file.txt && echo "Sally created sally_file.txt successfully."

echo "Acting as Bob to create a file in 'prac5' (should fail)..."
if sudo -u Bob touch prac5/bob_file.txt 2>/dev/null; then
    echo "Bob created bob_file.txt (unexpected)."
else
    echo "Bob could NOT create bob_file.txt as expected (permission denied)."
fi

echo "Done."
