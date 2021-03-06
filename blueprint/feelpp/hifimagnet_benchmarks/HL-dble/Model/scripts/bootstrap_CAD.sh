#!/bin/bash -l

# Singularity image retrieved from
# https://www.singularity-hub.org/collections/253

module load singularity/2.4.2

# Copy singularity image only if the user has not put an image on lustre with
# the same name.
if [ ! -f $1/$2 ]; then
    if [ ! -f ${SINGULARITY_REPO}/$2 ]; then
        echo "You should download a Feel++ singularity and place it in $1/ first!"
        exit 1
    else
        echo "Copying singularity file $SINGULARITY_REPO/$2 to $1"
        cp $SINGULARITY_REPO/$2 $1
    fi
else
    echo "Bootstrap will use $1/$2 singularity image!"
fi

# Get Simulation directory name

DATADIR=$3
cd $DATADIR
REMOTE_URL=$4
wget $REMOTE_URL
ARCHIVE=$(basename $REMOTE_URL)
# tar zxvf $ARCHIVE
# DIRNAME=$(basename $ARCHIVE .tgz)
