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
  
        # setup xvfb for headless mode without xServer present on linux
        # https://github.com/openscad/openscad/issues/1798
        Xvfb :99 & export DISPLAY=:99
    fi
    
    for filename in $input_file/*.scad; do
        # remove double slashes from input
        cleanInput="${filename//"//"/"/"}" 
        
        # get pasename and remove double slashes from input    
        shortOutput=$output_file/$(basename $filename).$target_format_for_bulk
        cleanOutput="${shortOutput//"//"/"/"}" 

        echo -e "Input \e[32m$cleanInput\e[39m"
        echo -e "Output \e[33m$cleanOutput\e[39m"

        openscad $options -o $cleanOutput $cleanInput

        if [ "$target_format_for_bulk" == "png" ]; then
            echo "| ![]($cleanOutput) | [$(basename $cleanInput)]($cleanInput) |" >> $readme
        fi

    done

    if [ "$target_format_for_bulk" == "png" ]; then
        echo "*This is a generated file from github actions, please do not change it by hand*" >> $readme
    fi

elif [[ -f $input_file ]]; then
    echo "$input_file is a single file, target format will be used from output_file"
    openscad $options -o $output_file $input_file
else
    echo "$input_file $output_file is not valid, must be both a directory or both a file"
    exit 1
fi
