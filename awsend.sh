#!/bin/bash
if [ -z "$1" ]
then
    echo "we should never get here. zero parameters.\n"
    exit 1;
else
    echo "the first name is \"$1\"";
    echo "the second name is \"$2\"";
fi
dir="$1";
name="$2";



aws s3 cp --recursive "$dir" s3://all2sides.com/news-clips/"$name" --exclude "*" --include "*nytimes*compressed.pdf" --include "*wsj*compressed*" --include "*washingtonpost*compressed*" --include "*fox*compressed*" --include "*png" --include "*cnn*compressed*";
