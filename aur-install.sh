#!/bin/sh
if [ -z "$1" ]
then
	echo "Error: no package specified"
else
	mkdir ~/.aur-install
	rm ~/.aur-install/$1
	git clone `echo "https://aur.archlinux.org/"$1".git"` ~/.aur-install/$1 \
	&& cd ~/.aur-get/$1	\
	&& makepkg -Asrif --skipinteg \
	&& rm ~/.aur-install/$1 -rf
fi
