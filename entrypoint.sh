#!/bin/sh -leux

file="${1}"
output_option="${2}"

openscad -o $output_option $file
