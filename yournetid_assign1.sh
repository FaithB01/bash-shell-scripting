#!/bin/bash
# Bash Menu Script 
# Option 1 prompts user to create a number
# Option 2 format of the date
# Option 3 generate number 1-99
# Option 4 writes analysis
# Option 5 exits the script 

PS3='Please enter your menu option: '
options=("Option 1" "Option 2" "Option 3" "Option 4" "Option 5")
select opt in "${options[@]}"
do
    case $opt in
        "Option 1")
            read -p "create 3 random numbers: " num1 num2 num3
           # numbers=$num1 $num2 $num3
            echo "Numbers: $num1, $num2, $num3"
               
               #checks $number if is numeric or non-numeric
            if ! [[ "$num1" =~ ^[0-9]+$ ]] && ! [[ "$num2" =~ ^[0-9]+$ ]]  && ! [[ "$num3" =~ ^[0-9]+$ ]] 
            then 
            echo "error: is non-numeric value.Please try again... " >&2; exit 5
            fi
            ;;
        "Option 2")
            d=`date +%D-%T-%j`
            echo "Format of the date with Julian day: "$d
            ;;
        "Option 3")
            echo $(( $RANDOM % 99 + 0 ))
            ;;
        "Option 4")
            echo -e "Enter the name of the file: \c"
            read file_name
            
            if [ -e $file_name ]
            then
            echo "ERROR:File name already exists" >&2; exit 25
            else
            echo "The date Format is in:${options[1]} and generated random numbers is in :${options[2]} ">>$file_name
            fi
            ;;
        "Option 5")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done