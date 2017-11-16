#!/bin/bash
if [ -z "$1" ]
then
    echo "we should never get here. zero parameters.\n"
    exit 1;
else
    echo "the first name is \"$1\"";
    echo "the second name is \"$2\"";
    echo "the third name is \"$3\"";
fi
name="$1";
pdf="$2";
direct="$3";

hd="/Users/jamiemorgenstern/backup";
wkh="/usr/local/bin/wkhtmltopdf";
wkhps="/usr/local/bin/wkhtmltoimage";
wind="$hd/wkhtmltopdf-individual.sh";
mkdir "$direct"
cp "$wkh" "$direct/";
cp "$wind" "$direct/";

grabpdf () {
    if [ -z "$1" ]
    then
	echo "we should never get here. zero parameters.\n"
	exit 1;
    else
	echo "the variable name is \"$1\""
	B=1;
	while [ "$B" -ne "0" ];
	do
	    tt=`date +%Y-%m-%d.%H:%M:%S`
	    ! "$phant" "$raster" "$1" "$direct/$2-$tt-phantomjs".pdf | grep -q 'TypeError'
	    B=$?;
	    echo "B value is $B\n";
 	    if [ "$1" = "http://www.theguardian.com" ]  || [ "$1" = "http://www.wsj.com" ] || [ "$1" = "http://www.thefiscaltimes.com" ] || [ "$1" = "http://www.huffingtonpost.com" ] || [ "$1" = "http://www.nytimes.com" ] || [ "$1" = "http://www.usatoday.com" ] || [ "$1" = "http://www.thedailycaller.com" ] ||  [ "$1" = "http://www.naturalnews.com" ] ||  [ "$1" = "http://www.theblaze.com" ]
	    then
		B=0;
	    fi
	    if [  "$B" -eq "1" ]
	    then
		rm "$direct/$2-$tt-phantomjs".pdf;
	    fi
	done
    fi
    return 0;
}


grabpdf-new () {
    if [ -z "$1" ]
    then
	echo "we should never get here. zero parameters.\n"
	exit 1;
    else
	echo "the variable name is \"$1\""
	tt=`date +%Y-%m-%d.%H:%M:%S`;
	gtimeout 100  "$phant"  "$raster"  "$1" "$direct/$2-$tt-phantomjs".pdf;
    fi
    return 0;
}


grabpdf-wkh () {
    if [ -z "$1" ]
    then
	echo "we should never get here. zero parameters.\n"
	exit 1;
    else
	tt=`date +%Y-%m-%d.%H:%M:%S`;
	gtimeout 140  "$wkh" --javascript-delay 5000 -d 300 -L 0mm -R 0mm -T 0mm -B 0mm --page-width 10in --page-height "$3in" --viewport-size 1380x10024  "$1" "$direct/$2-wkh.pdf";
	if  [ "$1" = "http://www.foxnews.com" ]
	then
	    gs -o "$direct/$2-wkh.cropped.pdf" -sDevice=pdfwrite -dDEVICEWIDTHPOINTS=695 -dDEVICEHEIGHTPOINTS=2087 -dFIXEDMEDIA -c "24 72 translate" -c " 0 0 1835 722 rectclip" -f "$direct/$2-wkh.pdf";
	fi
        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$direct/$2-wkh.compressed.pdf" "$direct/$2-wkh.pdf";
    fi
    return 0;
}


grabpdf-wkh "$1" "$2" '33';
