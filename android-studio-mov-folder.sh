#!/bin/bash

# renames folder in the list

mv_bg_files(){
    
    prefix="drawable-"
    newprefix="$1-"
    newdirs=(
        "ldpi"
        "mdpi"
        "hdpi"
        "xhdpi"
        "xxhdpi"
        "xxxhdpi"
    )

    echo "Renamig folders"
    for t in ${newdirs[@]}; do
        mv $prefix$t $prefix$newprefix$t
    done
}

mv_bg_files $1