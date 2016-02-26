From jupyter/datascience-notebook 

RUN curl -k -L -O https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.7.1-cp34-none-linux_x86_64.whl && \
    mv tensorflow-0.7.1-cp34-none-linux_x86_64.whl tensorflow-0.7.1-cp35-none-linux_x86_64.whl 
RUN pip install tensorflow-0.7.1-cp35-none-linux_x86_64.whl
RUN /bin/bash -c "source activate /opt/conda/envs/python2/ && pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.7.1-cp27-none-linux_x86_64.whl"
 
RUN pip install skflow
RUN /bin/bash -c "source activate /opt/conda/envs/python2/ && pip install skflow"

USER root
RUN apt-get install -y graphviz-dev graphviz pkg-config

USER jovyan
RUN pip install nxpd pydot2 pygraphviz
RUN /bin/bash -c "source activate /opt/conda/envs/python2/ && pip install nxpd pydot2 pygraphviz"

USER root
RUN apt-get install -y libgdal-dev
USER jovyan
RUN CPLUS_INCLUDE_PATH=/usr/include/gdal C_INCLUDE_PATH=/usr/include/gdal pip install GDAL==1.10
RUN pip install georasters
