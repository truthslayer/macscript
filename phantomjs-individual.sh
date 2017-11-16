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
phant="$hd/phantomjs/bin/phantomjs";
phantind="$hd/phantomjs-individual.sh";
rast="$hd/html/news-clips/rasterize.js";
cp "$rast" "$direct/";
cp "$phantind" "$direct/";

	
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
#	    tt=`date +%Y-%m-%d.%H:%M:%S`
#	    ! "$phant" "$rast" "$1" "$direct/$2-$tt-phantomjs".pdf | grep -q 'TypeError'
	    ! "$phant" "$rast" "$1" "$direct/$2-phantomjs".pdf | grep -q 'TypeError'
	    B=$?;
	    echo "B value is $B\n";
 	    if [ "$1" = "http://www.theguardian.com" ]  || [ "$1" = "http://www.wsj.com" ] || [ "$1" = "http://www.thefiscaltimes.com" ] || [ "$1" = "http://www.huffingtonpost.com" ] || [ "$1" = "http://www.nytimes.com" ] || [ "$1" = "http://www.usatoday.com" ] || [ "$1" = "http://www.thedailycaller.com" ] ||  [ "$1" = "http://www.naturalnews.com" ] ||  [ "$1" = "http://www.theblaze.com" ] ||  [ "$1" = "http://www.occupydemocrats.com" ]
	    then
		B=0;
	    fi
	    if [  "$B" -eq "1" ]
	    then
		rm "$direct/$2-phantomjs".pdf;
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
	if  [ "$1" = "http://www.cnn.com" ]
	then
#	    echo "	    gtimeout 80  $phant $rast $1 $direct/$2-phantomjs.png;";
#	    gtimeout 80  "$phant" "$rast" "$1" "$direct/$2-phantomjs".png;
	    gtimeout 80  "$phant" "$rast" "$1" "$direct/$2-phantomjs".pdf;
	    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$direct/$2-phantomjs.compressed".pdf "$direct/$2-phantomjs".pdf;
	else
#	    echo "	    gtimeout 80  $phant $rast $1 $direct/$2-phantomjs.png;";
	    gtimeout 80  "$phant" "$rast" "$1" "$direct/$2-phantomjs".pdf;
	    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$direct/$2-phantomjs.compressed".pdf "$direct/$2-phantomjs".pdf;
	fi
    fi
    return 0;
}



grabpdf-new "$name" "$pdf";
#grabpdf "$name" "$pdf";
