#! /bin/bash
cd mock_grading/
roll=$(cat roll_list)
cd ..
touch distribution.txt
touch marksheet.csv
cd organised
for number in $roll;do
	cd "$number"
	mkdir student_outputs
	g++ *.cpp -o executable 2>/dev/null
	marks=0
	input=$(ls ../../mock_grading/inputs)
	for file in $input;do
		timeout 5 ./executable<../../mock_grading/inputs/$file>student_outputs/"${file%.*}".out 2>/dev/null
		if cmp -s ../../mock_grading/outputs/"${file%.*}".out student_outputs/"${file%.*}".out
		then
	        	((marks++))
		fi
	done
	echo "$marks">/dev/null >> ../../distribution.txt
	echo ""$number",$marks">/dev/null >> ../../marksheet.csv
	sort ../../distribution.txt >/dev/null
	sort ../../marksheet.csv >/dev/null
	cd ..
done
cd ..

