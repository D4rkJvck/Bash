#!/bin/bash

#____________________________________________________________________________________
#                                                                   Check Credentials
Cred_Check() {

    if ! git config --get user.name || ! git config --get user.email
    then
        git config --global user.name "D4rkJvck"
        git config --global user.email "d4rkjvck@gmail.com"

        echo -e "Credentials Configured...\n"
    fi
}

#____________________________________________________________________
#                                                        Check Branch
Banch_Check() {

    echo -e "\nProject Branches:"
    git branch -a

    if [ "$(git rev-parse --abbrev-ref HEAD)" != "main" ]
    then
        echo -e "\nWARNING! Not on branch 'main'\n"
        exit 1
    fi
}

#_________________________________________________________
#                                                Add Files
Add() {
    
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
            echo -e "Added: $file\n"
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