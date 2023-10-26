#/bin/bash

files="/tmp/caj/*.caj"

cd /app

for file in $files 
do
	/usr/local/bin/python caj2pdf convert $file -o $file.pdf
done
