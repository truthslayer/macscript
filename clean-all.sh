#!/bin/bash

yd=$( date -d "yesterday 13:00 " '+%Y-%m-%d' )
hd="/home1/j/jamiemor"
aws="/home1/j/jamiemor/bin/aws"

cd "$hd";
#echo "html/news-clips/$yd";
Dropbox-Uploader/dropbox_uploader.sh upload html/news-clips/* Public/news-clips/;
#echo "html/news-clips/$yd";
rm -rf "html/news-clips/$yd"*;
#"$hd/clean-git.sh";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".00 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".01 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".02 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".03 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".04 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".05 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".06 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".07 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".08 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".09 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".10 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".11 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".12 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".13 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".14 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".15 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".16 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".17 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".18 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".19 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".20 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".21 --include "*";
"$aws" s3 rm --recursive s3://all2sides.com/news-clips/"$yd".22 --include "*";
rm -rf "$hd/html/news-clips/$yd*";
#cp change.sh "$direct/";
#cd "$direct";
#./change.sh;
#mv "$direct/*" "$hd/html/news-clips/$direct/";
#cd "$hd/html/news-clips/$direct/";
#find . -name "*.pdf" | xargs -i chmod 777 {};
