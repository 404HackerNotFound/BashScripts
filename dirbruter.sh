#!/bin/bash
echo "======================================================"
echo "============== Directories Bruteforcer ==============="
echo "======================================================"
if [[ $1 == '' ]] || [[ $2 == '' ]] || [[ $3 == '' ]] || [[ $1 == '-h' ]] || [[ $1 == '--help' ]]; then
	echo "Usage - $0 http://domain.com wordlist.txt output.txt"
	exit
fi

for i in $(cat $2);
do
        cmd=$(curl --write-out %{http_code} --silent --output /dev/null -m 5 $1/$i)
	if [ $cmd -eq 404 ]; then
	  continue
	else
	  echo "$1/$i = Found" && echo "$1/$i" >> $3
	fi
done
