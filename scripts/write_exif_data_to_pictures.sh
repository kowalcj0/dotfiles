#!/usr/bin/env bash
# Author: kowalcj0


# Define some variables
AUTHOR="Janusz Kowalczyk"
CONTACT="na100procentchyba+wordpress@gmail.com"
COPYRIGHT="(c) Janusz Kowalczyk 2014. This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License. You may not use the material for commercial purposes. Yet, such a permission can be granted when requested from the author."


# remove Adobe's custom lens profile name with orignal one
get_clean_lens_profile_name() {
    PICTURE="${1}"
    LENSPROFILENAME=$(exiftool -s -xmp:LensProfileName "${PICTURE}" | cut -d\: -f2)
    if [[ $LENSPROFILENAME == *Adobe* ]]
    then
        echo ${LENSPROFILENAME} | cut -d "(" -f2 | cut -d ")" -f1
    else
        echo ${LENSPROFILENAME}
    fi
}


# use exiftool to modify meta-data
write_exif_data_down() {
    PICTURE="${1}"
    exiftool -overwrite_original \
             -Artist="${AUTHOR}" \
             -Author="${AUTHOR}" \
             -Contact=${CONTACT} \
             -Copyright="${COPYRIGHT}" \
             -Photoshop:All= \
             -Software= \
             -exif:SerialNumber=  \
             -xmp-crs:CameraProfile="Standard" \
             -xmp-crs:LensProfileName="${LENSPROFILENAME}" \
             -xmp-dc:Creator="${AUTHOR}" \
             -xmp-dc:Rights="${COPYRIGHT}" \
             -xmp-photoshop:DateCreated= \
             -xmp-xmpMM:History= \
             -xmp:CreatorTool= \
             -xmp:SerialNumber= "${PICTURE}"
}


# run functions in proper sequence
main() {
    for PICTURE in *.jpg ;
    do
        LENSPROFILENAME=$(get_clean_lens_profile_name "${PICTURE}")
        write_exif_data_down "${PICTURE}"
    done;
}


# run main function
main

