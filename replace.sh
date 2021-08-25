#!/bin/bash

column="\"$1\""
find="\"$2\""
replace="\"$3\""
x=1

echo "$column $find $replace"
for i in $(head -n 1 fileforreplace.txt | tr "," "\n")
do
    if [ "$column" == "$i" ]
    then
        break
    fi
    ((x++))
done

awk -F"[,]" -v f="$find" -v r="$replace" -v c="$x" '{if($c == f){ $c=r;for(i=1;i<=NF;i++){printf "%s%s",(NR>1?",":""),$i} printf "\n"}else{print $0;}}'  fileforreplace.txt > final.txt
cp final.txt fileforreplace.txt
column -t -s"," fileforreplace.txt > final.txt