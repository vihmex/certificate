#!/bin/bash

#This scripts automates the creation of a certifcate considering user entered data

#Variable declaration

empName=""
empID=""
empMarks=""
empGrade=""

#Function definition

#Asks user for employee information
getInfo (){
        echo "Please enter the employee name:"
        read empName
        echo "Employee ID:"
        read empID
        echo "Finally, the employee marks: (only use decimal numbers)"
        read empMarks
}

#Converts marks to grades
markToGrade (){
        if [ "$empMarks" -ge 0 ] && [ "$empMarks" -le 69 ]; then
                empGrade="Fail"

        elif [ "$empMarks" -ge 70 ] && [ "$empMarks" -le 79 ]; then
                empGrade="C"

        elif [ "$empMarks" -ge 80 ] && [ "$empMarks" -le 89 ]; then
                empGrade="B"

        elif [ "$empMarks" -ge 90 ] && [ "$empMarks" -le 100 ]; then
                empGrade="A"

        else
                echo "The mark was not valid, please try again."
        fi
}

#Checks if directory where certificate goes already exists

checkFolder (){
        if [ -d $empId ]; then
                echo "The information for this employee has already been entered."
        else
                echo "Does not exist"
        fi
}

#Writes a file called certificate.txt with the information provided by the user
createCert (){
        echo -e "Dear $empName, \n" >> certificate.txt
        echo -e "\tDue to your performance during the Linux course, we are proud to give you the following grade:\n" >> certificate.txt
        echo -e "\t\t$empGrade \n" >> certificate.txt
        echo -e "Enjoy!" >> certificate.txt
}

#Program flow

getInfo

echo -e "$empID" >> list.txt

if [ -d $empID ]; then
        cd $empID
        markToGrade
        createCert
else
        mkdir $empID
        cd $empID
        markToGrade
        createCert
fi
