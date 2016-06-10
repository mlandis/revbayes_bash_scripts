#!/bin/bash
debug=0

# accepts a file list, e.g. "*.nex"
filelist=$@

# model list must match .Rev script
models=("JC" "F81")

# call `rb_gene_job.sh` for each file
for file in $filelist; do
    for m in ${models[@]}; do
        echo "Running model \"$m\" for \"$file\""
        id=$(basename ${file%%.*})
        if [ $debug == 0 ] ; then
            # run all jobs without stdout
            nohup ./rb_gene_job.sh $file $id $m &>/dev/null &
        else 
            # run serial jobs with stdout
            ./rb_gene_job.sh $file $id $m
        fi
    done
done
echo "...done!"
