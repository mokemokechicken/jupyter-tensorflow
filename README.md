About
=====

A docker container of Jupyter + tensorflow 

Build
========

```
sh ./build.sh
```

Usage
=========

see: https://github.com/jupyter/docker-stacks/tree/master/datascience-notebook

ex)

```
docker run -d -p 8888:8888 -v `pwd`/notebooks:/home/jovyan/work -e PASSWORD="your_password" -e GRANT_SUDO=yes --user root mokemokechicken/jupyter-tensorflow start-notebook.sh
```

