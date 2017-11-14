#!/bin/bash

tod=`date +%Y-%m-%d.%H`
hd="/Users/jamiemorgenstern/backup";
nc="$hd/html/news-clips";
direct="$hd/html/news-clips/$tod";
mkdir "$direct";
chmod 777 "$direct";
cp "$hd/puppet-individual.sh" "$direct/"; 
cp "$hd/collect-puppet.sh" "$direct/"; 
#cp "/usr/local/bin/node" "$direct/";
#cp -r "$hd/node_modules/puppeteer" "$direct/";
cp "$hd/chrome/fullpage.js" "$direct/";
cp "$hd/chrome/fullpage-begin.js" "$direct/";
echo "$hd/awsend.sh $direct $tod" >> "hi0.text";

parallel --link "$hd/puppet-individual.sh"  :::: "$hd/"inputs-html :::: "$hd/"inputs ::: "$direct";

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
