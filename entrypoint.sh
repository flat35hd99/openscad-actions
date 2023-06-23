#!/bin/bash -leux

input_file="${1}"
output_file="${2}"
options="${3}"
target_format_for_bulk="${4}"



# check if input is file or directory
if [[ -d $input_file && -d $output_file ]]; then
    echo "$input_file and $output_file are directories, runnung bulk mode"
    readme=$output_file/README.md

    if [ "$target_format_for_bulk" == "png" ]; then
        echo "You are creating images, so i create a readme file for you as a galery. Just move it to parent directory and the links will work"
        echo "# OpenScad Projects" > $readme
        echo "| Image | Filename |" >> $readme
        echo "| --- | --- |" >> $readme
    fi

    for filename in $input_file/*.scad; do
        echo $filename
        shortname=$output_file/$(basename $filename).$target_format_for_bulk
        echo $shortname
        openscad $options -o $shortname $filename

        if [ "$target_format_for_bulk" == "png" ]; then
            echo "| ![]($shortname) | [$filename]($filename) |" >> $readme
        fi

    done

elif [[ -f $input_file ]]; then
    echo "$input_file is a single file, target format will be used from output_file"
    openscad $options -o $output_file $input_file
else
    echo "$input_file $output_file is not valid, must be both a directory or both a file"
    exit 1
fi
