#!/bin/sh -leux

input_file="${1}"
output_file="${2}"

openscad -o $output_file $input_file
