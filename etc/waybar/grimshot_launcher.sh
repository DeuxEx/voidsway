#!/bin/bash


#chmod +x myscript.sh
#./myscript.sh one
#./myscript.sh two
#./myscript.sh three


#mkdir $HOME/Pictures


# Define your three different functions
function_one() {
    echo "Running the first function! 🚀"
	createdir=$HOME/Pictures/$(date +%Y-%m-%d)
	createfile=$(date +%Y_%m_%d_%k%M_%N).png
	tmpfile=$HOME/Pictures/$(date +%Y_%m_%d_%k%M_%N).png
	touch $tmpfile
	mkdir -p $createdir
	grimshot --notify savecopy area $tmpfile
	sleep 0.5
	cp $tmpfile $createdir/$createfile
	rm -rf $tmpfile
	#grimshot savecopy area $HOME/Pictures/$createdir/$(date +%Y_%m_%d_%k%M_%N).png
	echo "Screen screenshot taken." > /tmp/waybar/pipe
	(sleep 3 && echo "" > /tmp/waybar/pipe) >/dev/null 2>&1 &
}

function_two() {
    echo "Running the second function! 🛠️"
    #"shot_screen":
    createdir=$HOME/Pictures/$(date +%Y-%m-%d)
	createfile=$(date +%Y_%m_%d_%k%M_%N).png
	touch $tmpfile
    mkdir -p $createdir
    grimshot savecopy screen $tmpfile
	sleep 0.5
	cp $tmpfile $createdir/$createfile
	rm -rf $tmpfile
    #grimshot savecopy screen $HOME/Pictures/$createdir/$(date +%Y_%m_%d_%k%M_%N).png
	#echo "Screen screenshot taken." > /tmp/waybar/pipe<br>
}

function_three() {
    echo "Running the third function! 📊"
    #"shot_window":
    createdir=$HOME/Pictures/$(date +%Y-%m-%d)
	createfile=$(date +%Y_%m_%d_%k%M_%N).png
    touch $tmpfile
    mkdir -p $createdir
    grimshot savecopy window $tmpfile
	sleep 0.5
	cp $tmpfile $createdir/$createfile
	rm -rf $tmpfile
    #grimshot savecopy window $HOME/Pictures/$createdit/$(date +%Y_%m_%d_%k%M_%N).png
	#echo "Windows screenshot taken." > /tmp/waybar/pipe<br>
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
