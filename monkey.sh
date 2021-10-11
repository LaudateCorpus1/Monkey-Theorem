#!/bin/bash 

wordcount=1000
linecount=$(wc -l usa.txt | awk '{print $1}')

filename=$(date +'%s')
while [ "$wordcount" -gt "0" ]
do 	
	randomnum=$(cat /dev/urandom | tr -dc 0-9 | fold -w${#linecount} | head -1 | sed 's/^0*//;')
	#randomword=$(shuf -e -n 1 english3.txt)
	if [ "$randomnum" -le "$linecount" ]
	then
		finalword=$(sed -n "$randomnum"p usa.txt)
		echo -n "$finalword "
	fi
	if [ $wordcount == "1" ]
	then
		echo -e "\nEND\n"
	fi
	((wordcount--))
done


