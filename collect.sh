#!/bin/bash

tod=`date +%Y-%m-%d.%H`
hd="/Users/jamiemorgenstern/backup";
nc="$hd/html/news-clips";
direct="$hd/html/news-clips/$tod";
mkdir "$direct";
chmod 777 "$direct";
cp "$hd/phantomjs-individual.sh" "$direct/"; 
cp "$hd/wkhtmltopdf-individual.sh" "$direct/"; 
cp "$hd/collect.sh" "$direct/"; 
cp "$hd/phantomjs/bin/phantomjs" "$direct/";
cp "$hd/html/news-clips/rasterize.js" "$direct/";
cp "$phant" "$direct/";
cp "$wkh" "$direct/";
echo "hello" > really.txt;
echo "$hd/awsend.sh $direct $tod" >> "hi0.text";



parallel --link "$hd/phantomjs-individual.sh"  :::: inputs-html :::: inputs ::: "$direct";
parallel --link "$hd/wkhtmltopdf-individual.sh"  :::: inputs-html :::: inputs ::: "$direct";

sleep 200;
chmod 777 "$direct";
cd "$hd";

echo "$hd/awsend.sh $direct $tod" >> hi.text;
"$hd"/awsend.sh "$direct" "$tod";
"$hd"/dropbox_uploader.sh upload "$direct" Public/news-clips/;
# "$hd/shallow-input.sh" "html/news-clips/$tod" "$tod";
#cp change.sh "$direct/";
#cd "$direct";
#./change.sh;
#mv "$direct/*" "$hd/html/news-clips/$direct/";
#cd "$hd/html/news-clips/$direct/";
#find . -name "*.pdf" | xargs -i chmod 777 {};


