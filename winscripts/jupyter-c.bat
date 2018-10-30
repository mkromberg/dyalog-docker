@ECHO OFF
ECHO "jupyter-c container is not yet availeble under Windows"
Exit

#!/bin/bash
if [[ $# -eq 0 ]]; 
then
    # Default: Open tree
    docker run -it --user dyalog --net=host -e DISPLAY=unix$DISPLAY -p 8888:8888 -v /tmp/.X11-unix:/tmp/.X11-unix dyalog/jupyter
    exit 0
fi
filepath=`readlink -f "$@"`
echo "$filepath"
if [[ $filepath == *.ipynb ]]
then
    folder=$(dirname "$filepath")
    filename=$(basename "$filepath")
else
    folder=$filepath;
fi
docker run -it --user dyalog --net=host -e DISPLAY=$DISPLAY -e NOTEBOOK="$filename" -p 8888:8888 -v /tmp/.X11-unix:/tmp/.X11-unix -v $folder:/app dyalog/jupyter
