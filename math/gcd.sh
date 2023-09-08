#!/bin/bash

GCD() {
    if "$first" % "$second"
    then
        echo -e "\n$second\n"
    else
        echo -e "GCD()"
    fi
}

read -r -p "First nNumber: " first
read -r -p "Second Number: " second

GCD first second