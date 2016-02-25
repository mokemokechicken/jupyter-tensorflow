#!/bin/sh

cd $(dirname $0)

docker run -d -p 8888:8888 -v `pwd`/notebooks:/home/jovyan/work -e PASSWORD="$PASSWORD" -e GRANT_SUDO=yes --user root mokemokechicken/jupyter-tensorflow start-notebook.sh
