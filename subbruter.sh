#!/bin/bash
echo "======================================================"
echo "================ Subdomain Bruteforcer ==============="
echo "======================================================"
if [[ $1 == '' ]] || [[ $2 == '' ]] || [[ $3 == '' ]] || [[ $1 == '-h' ]] || [[ $1 == '--help' ]]; then
	echo "Usage - $0 domain.com wordlist.txt"
	exit
fi

for i in $(cat $2);
do
        cmd=$(curl --write-out %{http_code} --silent --output /dev/null -m 5 $i.$1)
	if [ $cmd -eq 000 ]; then
	  continue
	else
	  echo "$i.$1 = Found" && echo "$i.$1" >> $3
	fi
done
echo "Completed."

