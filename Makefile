# Makefile for PELM 
#

help:
	echo "tasks : \n clean:  delete all .elc file"

clean:
	find . -type f -name *.elc |xargs echo 

