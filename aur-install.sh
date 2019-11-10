#!/bin/sh
if [ -z "$1" ]
then
	echo "Error: no package specified"
else
	mkdir ~/.aur-get
	rm ~/.aur-get/$1
	git clone `echo "https://aur.archlinux.org/"$1".git"` ~/.aur-get/$1	&& cd ~/.aur-get/$1	&& makepkg -Asrif --skipinteg && rm ~/.aur-get/$1 -rf
fi
