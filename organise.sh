#! /bin/bash
cd mock_grading/
roll=$(cat roll_list)
files=$(ls submissions/)
cd ..
mkdir organised
cd organised
for number in $roll;do
	mkdir "$number"
	for file in $files;do
		cd "$number"
		if [[ $file =~ $number ]];then
        	         ln -sf ../../mock_grading/submissions/"$file" $file
		fi
		cd ..
	done
done

