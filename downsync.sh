#!/bin/bash
#
# created by t0m-dev
# on 2024-12-15

# global vars
srcDir=''
destDir=''
batchFileSize='100M'

# custom functions
printHelp () {
	echo 'TODO:'
	echo 'PRINT HELP'

}

checkDirExistence () {
	if [ ! -d "$1" ]; then
		echo "$1 is not a directory or does not exist!"
		return 1
	fi
}

# Checking number of inputs
if [[ "$#" -eq 0 ]]; then
	printHelp
	exit 1
fi

# handling of argumnets
if [ "$1" = '-h' ]; then
	printHelp
	exit 0
fi

if [[ "$#" -gt 3 ]]; then
	echo "Got $# argumnets, but expectes 2 or 3 arguments"
	printHelp
	exit 1
fi

# puting arguments in variables for better readability
srcDir="$1"
destDir="$2"

if [[ "$#" -eq 3 ]]; then
	if [[ "$3" =~ ^[0-9]+[MG]?$ ]]; then
		batchFileSize="$3"
	else
		echo 'Input not in expected format:'
		echo 'Expected Format: ^[0-9]+[MG]?$'
		printHelp
		exit 1
	fi
fi

