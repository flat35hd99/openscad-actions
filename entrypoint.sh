#!/bin/sh -leux

input_file="${1}"
output_file="${2}"
options="${3}"

openscad $options -o $output_file $input_file
