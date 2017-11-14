#!/bin/bash

yd=$( date -d "yesterday 13:00 " '+%Y-%m-%d' )
hd="/home1/j/jamiemor";
mkdir "$hd/tmp-git";
cd "$hd/tmp-git";
git init .;
git remote add origin "git@github.com:truthslayer/readittwice.git"
git config core.sparsecheckout true;
echo "news-clips/$yd*" > .git/info/sparse-checkout;
git pull --depth=1 origin master;
git rm -rf "news-clips";
git commit -m "removing all news-clips $yd";
git push  --set-upstream origin master;
rm -rf "news-clips/$yd*";
#cp change.sh "$direct/";
#cd "$direct";
#./change.sh;
#mv "$direct/*" "$hd/html/news-clips/$direct/";
#cd "$hd/html/news-clips/$direct/";
#find . -name "*.pdf" | xargs -i chmod 777 {};
