#!/bin/bash

for file in *.snippet; do 
    #mv $file "`echo $file|sed -e 's/sublime-//g'`" ;
    desc="`cat $file |grep '</description>'| sed -e 's/<description>\(.*\)<\/description>/\1/g'`";
    key="`cat $file |grep '<\/tabTrigger>'| sed -e 's/<tabTrigger>\(.*\)<\/tabTrigger>/\1/g'`";

    echo "# -*- mode: snippet -*-" > tmp;
    echo "# contributor : eggcaker <eggcaker@gmail.com>" >> tmp;
    echo "# name : $desc" >> tmp;
    echo "# key : $key" >> tmp;
    echo "# --" >> tmp;

    awk '/CDATA\[/,/]]/ {print $1;}' $file |sed -e 's/<content><!\[CDATA\[//g'|sed -e 's/\]\]><\/content>//g'  > tmp2;

    sed '/^$/d' tmp2 >> tmp;

    mv tmp $file;
    rm tmp2
done

