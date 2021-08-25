#! /bin/bash
# ID,Name,Phone,Salary,Email,Year
awk -F"[,]" '{if(!a[$2]++) print $2","$1","$3 }' file1.txt > file.txt

declare -A a
declare -A a2
declare -A a3

while read line
do
    a[$(echo $line | cut -d "," -f 1)]=$(echo $line | cut -d "," -f 2)

done < file2.txt 

while read line 
do
    if [ -z "${a[$(echo $line | cut -d "," -f 1)]}" ]
    then 
        echo "$line,-"
    else
        echo "$line,${a[$(echo $line | cut -d "," -f 1)]}"
    fi
done  < file.txt > tmp.txt

while read line
do
    a2[$(echo $line | cut -d "," -f 2)]=$(echo $line | cut -d "," -f 1)
    a3[$(echo $line | cut -d "," -f 2)]=$(echo $line | cut -d "," -f 3)
done < file3.txt 

while read line 
do
    if [ -z "${a2[$(echo $line | cut -d "," -f 3)]}" ]
    then 
        echo "$line,-,-"
    else
        echo "$line,${a2[$(echo $line | cut -d "," -f 3)]},${a3[$(echo $line | cut -d "," -f 3)]}"
    fi
done  < tmp.txt | column -t -s"," > final.txt

rm tmp.txt file.txt