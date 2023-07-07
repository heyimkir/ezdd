echo ezdd Version 1
echo calculating root...
sleep 1
ROOTDRIVERG=$(df / | grep / | cut -d " " -f1)
ROOTDRIVE=$(echo $ROOTDRIVERG | rev | cut -c2- | rev)
if  [[ $2 = *$ROOTDRIVE* ]]
then 
	echo FATAL: You have attempted to write an image to the root drive, which your system is running off. The script has ended to prevent catastrophic data destruction. 
	echo Exit Code 128
	exit
else
	sudo dd if=$1 of=$2 status=progress
fi

