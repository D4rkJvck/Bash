#!/bin/bash

GCD() {
    if [ $# -ne 3 ]
    then
        echo -e "\nNot enough arguments\n"
        exit
    fi
}
#read -r -p "First nNumber: " first
#read -r -p "Second Number: " second