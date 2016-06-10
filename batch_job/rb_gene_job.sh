#!/bin/bash

# arg1, input filename
file=$1

# arg2, stripped filename
id=$2

# arg3, rate matrix type
type_Q=$3

# construct the command string
rb_command="data_file = \"$file\";
            job_id = \"$id\";
            type_Q = \"$type_Q\";
            source(\"rb_gene_model.Rev\");"

# pipe the command into RevBayes
echo $rb_command | rb

