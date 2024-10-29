#!/bin/bash
BASE=/home/kali/myscripts/find_command
DAY=10
DEPTH=1
RUN=0

#checking dir is present or not
if [ ! -d $BASE ]
then
	echo "dic not exits : $BASE"
	exit 1
fi

#create 'archive' folder if not present
if [! -d $BASE/archive ]
then
       	mkdir $BASE/archive
fi

#listof file 

for i in 'find $BASE -maxdepth $DEPTH -type f -size +20M'
do
	if [ $RUN -eq 0 ]
	then
		gzip $i || exit 1
		mv $i.gz $BASE/archive ||exit 1
	fi
done














