#!/bin/bash

screenshots_dir=$HOME/Pictures/Screenshots/
scrot_file=$screenshots_dir/Screenshot_$(date '+%F_%TN%N').png
scrot $scrot_file && xclip -selection clipboard -t image/png -i $scrot_file
ln -fs -T $scrot_file $screenshots_dir/latest
