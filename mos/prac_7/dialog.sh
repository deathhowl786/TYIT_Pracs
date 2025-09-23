#!/bin/bash

# Temp file for dialog input/output
TMP_FILE=$(mktemp)

# Function: Create a new file
create_file() {
    dialog --inputbox "Enter the full path for the new file:" 10 50 2> "$TMP_FILE"
    file_path=$(<"$TMP_FILE")
    if [ -n "$file_path" ]; then
        touch "$file_path" && dialog --msgbox "File created: $file_path" 6 50
    fi
}

# Function: Delete a file
delete_file() {
    dialog --inputbox "Enter the full path of the file to delete:" 10 50 2> "$TMP_FILE"
    file_path=$(<"$TMP_FILE")
    if [ -f "$file_path" ]; then
        rm -i "$file_path" && dialog --msgbox "File deleted: $file_path" 6 50
    else
        dialog --msgbox "File not found." 6 40
    fi
}

# Function: View a file
view_file() {
    dialog --inputbox "Enter the full path of the file to view:" 10 50 2> "$TMP_FILE"
    file_path=$(<"$TMP_FILE")
    if [ -f "$file_path" ]; then
        dialog --textbox "$file_path" 20 60
    else
        dialog --msgbox "File not found." 6 40
    fi
}

# Function: Employee data entry
employee_data_entry() {
    dialog --inputbox "Enter Employee Name:" 10 40 2> "$TMP_FILE"
    name=$(<"$TMP_FILE")
    dialog --inputbox "Enter Employee ID:" 10 40 2> "$TMP_FILE"
    emp_id=$(<"$TMP_FILE")
    dialog --inputbox "Enter Department:" 10 40 2> "$TMP_FILE"
    dept=$(<"$TMP_FILE")
    dialog --inputbox "Enter Email:" 10 40 2> "$TMP_FILE"
    email=$(<"$TMP_FILE")

    echo "$name, $emp_id, $dept, $email" >> employees.csv
    dialog --msgbox "Employee data saved." 6 40
}

# Main menu loop
while true; do
    dialog --clear --title "File & Employee Manager" \
        --menu "Choose an option:" 15 50 6 \
        1 "Create New File" \
        2 "Delete File" \
        3 "View File" \
        4 "Enter Employee Info" \
        5 "Exit" 2> "$TMP_FILE"

    choice=$(<"$TMP_FILE")

    case $choice in
        1) create_file ;;
        2) delete_file ;;
        3) view_file ;;
        4) employee_data_entry ;;
        5) break ;;
        *) break ;;
    esac
done

# Cleanup
rm -f "$TMP_FILE"
clear
