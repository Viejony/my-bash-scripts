# This script should be executed in "<android_project>/app/src" folder
# Creates folders and moves a file to the crated folder

mv_bg_files(){
    
    prefix="drawable-"
    newprefix="night-"
    newdirs=(
        "ldpi"
        "mdpi"
        "hdpi"
        "xhdpi"
        "xxhdpi"
        "xxxhdpi"
    )

    echo "Moving to $1 folder"
    cd $1/res
    echo "Current folder $PWD"
    echo "Moving files in $1 folder"
    for t in ${newdirs[@]}; do
        mkdir $prefix$newprefix$t
        git mv -f "$prefix$t/bg_dark.png" "$prefix$newprefix$t/bg.png"
    done
    cd ../..
    echo "Returning to $PWD"
    echo ""
}

folders=(
    "equirent"
    "fleetment"
    "Space"
    "equirent"
    "fleetment"
    "gpscondor"
    "innovatech"
    "integra"
    "laarcom"
    "localizapy"
    "monitech"
    "ohkla"
    "rastrackgps"
    "satcontrol"
    "satgeo"
    "spy"
    "sutech"
    "tgr"
)

for t in ${folders[@]}; do
    mv_bg_files $t
done