#! /bin/bash
if [[ "$#" -eq 2 ]];then
	wget -q --reject html,tmp -r -nH --cut-dirs="$2" --no-parent $1
	if [[ "$?" -ne 0 ]];then
		 echo "Usage: bash download.sh <link to directory> <cut-dirs argument>"
	fi
	if [[ $(basename $1) != "mock_grading" ]];then
		mv $(basename $1) mock_grading
	fi
	exit 0
else
	echo "Usage: bash download.sh <link to directory> <cut-dirs argument>"
	exit 1
fi

	
