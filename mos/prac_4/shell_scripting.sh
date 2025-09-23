#!/bin/bash

# Print current time
echo "Current time is: $(date '+%Y-%m-%d %H:%M:%S')"

# Create a folder in a specified directory
read -p "Enter the full path where you want to create a folder: " base_dir
read -p "Enter the name of the new folder: " folder_name

mkdir -p "$base_dir/$folder_name" && echo "Folder created at: $base_dir/$folder_name" || echo "Failed to create folder."

# Create multiple folders in a specified directory
read -p "Enter the directory where you want to create multiple folders: " multi_dir
read -p "Enter the number of folders to create: " count
read -p "Enter base name for folders (e.g., Folder): " base_name

for ((i = 1; i <= count; i++)); do
    mkdir -p "$multi_dir/${base_name}_$i"
done
echo "$count folders created in $multi_dir."

# Check if a file or folder exists
read -p "Enter the full path of the file or folder to check: " path_check

if [ -e "$path_check" ]; then
    echo "'$path_check' exists."
    if [ -f "$path_check" ]; then
        echo "It is a file."
    elif [ -d "$path_check" ]; then
        echo "It is a directory."
    fi
else
    echo "'$path_check' does NOT exist."
fi

# Install an application
read -p "Enter the name of the application to install: " app_name

# Check if user is root or using sudo
if [[ $EUID -ne 0 ]]; then
    echo "You need to run this script with sudo to install applications."
else
    apt update
    apt install -y "$app_name" && echo "'$app_name' installed successfully." || echo "Failed to install '$app_name'."
fi

