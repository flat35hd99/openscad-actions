#!/bin/sh -leux

file="${1}"
output_option="${2}"

/AppDir/bin/openscad -o $output_option $file
