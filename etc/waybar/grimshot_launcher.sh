#!/bin/bash


#chmod +x myscript.sh
#./myscript.sh one
#./myscript.sh two
#./myscript.sh three


#mkdir $HOME/Pictures


# Define your three different functions
function_one() {
	createdir=$HOME/Pictures/$(date +%Y-%m-%d)
	createfile=$(date +%Y_%m_%d_%H%M_%N).png
	tmpfile=$HOME/Pictures/$(date +%Y_%m_%d_%k%M_%N).png
	touch $tmpfile
	mkdir -p $createdir
	grimshot savecopy area $tmpfile
	sleep 0.5
	cp $tmpfile $createdir/$createfile
	rm -rf $tmpfile
	echo "Area screenshot taken." > /tmp/waybar/pipe
    sleep 1
	(sleep 1 && echo "" > /tmp/waybar/pipe) >/dev/null 2>&1 &
}



function_two() {
    createdir=$HOME/Pictures/$(date +%Y-%m-%d)
	createfile=$(date +%Y_%m_%d_%H%M_%N).png
	touch $tmpfile
    mkdir -p $createdir
    grimshot savecopy screen $tmpfile
	sleep 0.5
	cp $tmpfile $createdir/$createfile
	rm -rf $tmpfile
	echo "Screen screenshot taken." > /tmp/waybar/pipe
	sleep 1
	(sleep 1 && echo "" > /tmp/waybar/pipe) >/dev/null 2>&1 &
}



function_three() {
    createdir=$HOME/Pictures/$(date +%Y-%m-%d)
	createfile=$(date +%Y_%m_%d_%H%M_%N).png
    touch $tmpfile
    mkdir -p $createdir
    grimshot savecopy window $tmpfile
	sleep 0.5
	cp $tmpfile $createdir/$createfile
	rm -rf $tmpfile
	echo "Window screenshot taken." > /tmp/waybar/pipe
	sleep 1
	(sleep 1 && echo "" > /tmp/waybar/pipe) >/dev/null 2>&1 &
}





# Check the first argument passed to the script ($1)
case "$1" in
    "one")
        function_one
        ;;
    "two")
        function_two
        ;;
    "three")
        function_three
        ;;
    *)
        echo "Usage: $0 {one|two|three}"
        exit 1
        ;;
esac
