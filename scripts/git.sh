#!/bin/bash

#________________________________________________________________________________________
#                                                                       Check Credentials
Cred_Check() {
    echo -e "\nChecking Credentials..."

    if ! git config --get user.name || ! git config --get user.email
    then
        echo -e "Credentials Not Configured...\n"

        read -r -p "Enter Git Username: " username
        read -r -p "Enter Git Email: " email

        if [ "$username" != "D4rkJvck" ] || [ "$email" != "d4rkjvck@gmail.com" ]
        then
            echo -e "\nWARNING! Unauthorized Credentials...\n"

            Cred_Check
        fi

        git config --global user.name "$username"
        git config --global user.email "$email"
    fi

    echo -e "Credentials Configured...\n"
}

#___________________________________________________________________________
#                                                               Check Branch
Banch_Check() {
    echo -e "\nProject Branches:"
    git branch -a

    current_branch=$(git rev-parse --abbrev-ref HEAD)
    expected_branch="main"

    if [ "$current_branch" != "$expected_branch" ]
    then
        echo -e "\nNot on expected branch( $expected_branch ) !\n"
        echo -e "Current branch: $current_branch\n"
        exit 1
    fi
}

#____________________________________________________________________
#                                                           Add Files
Add() {
    echo -e "\nSpecify Files to Add:"
    if [ $# -eq 0 ]
    then
        echo -e "No Files specified..."
        echo -e "Adding all changes...\n"
        git add .
    else
        echo -e "\nAdding Specified files...\n"
        for file in "$@"
        do
            git add "$file"
            echo -e "Added: $file"
            echo -e "\n"
        done
    fi
}

#______________________________________________________________
#                                           Syncing with GitHub

Cred_Check

Banch_Check

Add "$@"

git status

read -r -p "Enter Commit Message: " message

git commit -a -m "$message"

git push