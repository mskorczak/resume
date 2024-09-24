#!/bin/bash
BUILDFILES=("resume.tex","altacv.cls","README.md","build.sh","output.txt","resume.pdf")
echo "Building resume and deleting output.txt"
rm output.txt
echo "Building resume" | tee -a output.txt
echo -e "Generating resume PDF" | tee -a output.txt
pdflatex resume.tex -o resume.pdf > /dev/null
echo -e "Deleting build files" | tee -a output.txt
FILES=$(ls -r)
for file in $FILES
do
	if [[ " ${BUILDFILES[*]} " != *"$file"* ]];
	then
		rm $file
	fi
done
echo -e "Creating PNG version" | tee -a output.txt
convert -density 300 -colorspace sRGB resume.pdf -alpha off resume.png
echo -e "Done." | tee -a output.txt
