#!/usr/bin/sh

# make symlinks
DOTFILE_SYMLINKS=$(find ~+ -maxdepth 1 -type f  |egrep -v "\.(md|sh)$")
for df in ${DOTFILE_SYMLINKS[@]};
do

	FNAME=".$(basename $df)"
	echo "Generating symlink for:  $FNAME"
	
	# uncomment below to test
	#echo dryrun:  "ln -sf $df "$HOME/$FNAME"
	ln -sf $df "$HOME/$FNAME"
	#ln -sf $df ~"/$FNAME"
	#ln -sf $df "$HOME/.$df"
done
