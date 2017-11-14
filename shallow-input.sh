#!/bin/bash

hd="/home1/j/jamiemor"
gc="$hd/tmp-git/news-clips/$2"

rm -rf tmp-git;
mkdir tmp-git;
cd tmp-git;
git init . ;
git remote add origin "git@github.com:truthslayer/readittwice.git"
git config core.sparsecheckout true;
echo "news-clips/2010-01" > .git/info/sparse-checkout;
git pull --depth=1 origin master;
cp -r "$hd/$1" "news-clips/";
rm "$gc/wkhtmltopdf";
rm "$gc/rasterize.js";
rm "$gc/phantomjs";
rm "$gc/*.sh";
rm "$gc/*vanilla*";
git add "news-clips/$2";
git add "news-clips/$2/*";
git commit -m "daily push $2";
git push  --set-upstream origin master;
rm -rf "news-clips/$2";
cd ..;
rm -rf tmp-git;
