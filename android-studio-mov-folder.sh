#!/bin/bash

# This script should be used with and Android Studio Project, inside 'res' folder
# Renames folders in the list, adding the recevied string in the middle of the folder name.
# for example: using 'night' as parameter, 'res/drawable-hdpi' will be 'res/drawable-night-hdpi'

mv_bg_files(){
    
    prefix="res/drawable-"
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
