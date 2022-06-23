#!/bin/bash

logResult() {
	if [ $? -eq 0 ]; then
		echo -e "\xE2\x9C\x94 $1 [successful]"
	else
		echo -e "\xE2\x9C\x97 $1 [failed]"
	fi
}

export -f logResult
