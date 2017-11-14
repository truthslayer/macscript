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
node="/usr/local/bin/node";
puppet="$hd/chrome/fullpage-begin.js";
puppetnyt="$hd/chrome/fullpage.js";
mkdir "$direct"
cp "$puppet" "$direct/";

grabpuppet () {
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
	    ! "$node" "$puppet" "$1" "$direct/$2-$tt-puppet" | grep -q 'TypeError'
	    B=$?;
	    echo "B value is $B\n";
 	    if [ "$1" = "http://www.theguardian.com" ]  || [ "$1" = "http://www.wsj.com" ] || [ "$1" = "http://www.thefiscaltimes.com" ] || [ "$1" = "http://www.huffingtonpost.com" ] || [ "$1" = "http://www.nytimes.com" ] || [ "$1" = "http://www.usatoday.com" ] || [ "$1" = "http://www.thedailycaller.com" ] ||  [ "$1" = "http://www.naturalnews.com" ] ||  [ "$1" = "http://www.theblaze.com" ]
	    then
		B=0;
	    fi
	    if [  "$B" -eq "1" ]
	    then
		rm "$direct/$2-$tt-puppet".pdf;
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
	gtimeout 100  "$node"  "$puppet"  "$1" "$direct/$2-$tt-puppet";
    fi
    return 0;
}


grabpdf-puppet-2 () {
    if [ -z "$1" ]
    then
	echo "we should never get here. zero parameters.\n"
	exit 1;
    else
	tt=`date +%Y-%m-%d.%H:%M:%S`;
	if [ "$1" = "http://www.nytimes.com" ]
	then
	    gtimeout 140  "$node" "$puppetnyt" "$1" "$direct/$2-puppet";
	else 
	    gtimeout 140  "$node" "$puppet" "$1" "$direct/$2-puppet";
	fi
#	if  [ "$1" = "http://www.foxnews.com" ]
#	then
#	    gs -o "$direct/$2-puppet.cropped.pdf" -sDevice=pdfwrite -dDEVICEWIDTHPOINTS=695 -dDEVICEHEIGHTPOINTS=2087 -dFIXEDMEDIA -c "24 72 translate" -c " 0 0 1835 722 rectclip" -f "$direct/$2-puppet.pdf";
#	fi

        gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$direct/$2-puppet.compressed.pdf" "$direct/$2-puppet.pdf";
    fi
    return 0;
}


grabpdf-puppet-2 "$1" "$2" '33';
