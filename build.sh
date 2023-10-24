#!/bin/bash
BUILDFILES=("mskor_resume.tex","altacv.cls","README.md","build.sh","output.txt","mskor_resume.pdf")
echo "Building resume and deleting output.txt"
rm output.txt
echo "Building resume" | tee -a output.txt
echo -e "Generating resume PDF" | tee -a output.txt
pdflatex mskor_resume.tex -o mskor_resume.pdf > /dev/null
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
convert -density 300 -colorspace sRGB mskor_resume.pdf -alpha off mskor_resume.png
echo -e "Done." | tee -a output.txt
