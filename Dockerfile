From jupyter/datascience-notebook 

RUN curl -k -L -O https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.7.1-cp34-none-linux_x86_64.whl && \
    mv tensorflow-0.7.1-cp34-none-linux_x86_64.whl tensorflow-0.7.1-cp35-none-linux_x86_64.whl 
RUN pip install tensorflow-0.7.1-cp35-none-linux_x86_64.whl
RUN /bin/bash -c "source activate /opt/conda/envs/python2/ && pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.7.1-cp27-none-linux_x86_64.whl"
 
RUN pip install skflow
RUN /bin/bash -c "source activate /opt/conda/envs/python2/ && pip install skflow"

USER root
RUN apt-get update && apt-get install -y pkg-config
RUN apt-get install -y graphviz-dev graphviz pkg-config

USER jovyan
RUN pip install nxpd pydot2 pygraphviz
RUN /bin/bash -c "source activate /opt/conda/envs/python2/ && pip install nxpd pydot2 pygraphviz"

USER root
RUN apt-get install -y libgdal-dev

USER jovyan
RUN CPLUS_INCLUDE_PATH=/usr/include/gdal C_INCLUDE_PATH=/usr/include/gdal pip install GDAL==1.10
RUN pip install georasters

USER jovyan
RUN pip install keras h5py dateparser 
RUN pip install --upgrade pandas
RUN pip install google-api-python-client

ADD resources/IPAfont00303/ /usr/share/fonts/truetype/IPAFont/

WORKDIR "$HOME"
RUN curl -L -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-116.0.0-linux-x86_64.tar.gz
RUN tar xzf google-cloud-sdk-116.0.0-linux-x86_64.tar.gz
ENV CLOUDSDK_PYTHON=/usr/bin/python2
RUN ./google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=${HOME}/.bashrc

WORKDIR /home/jovyan/work

RUN pip install https://github.com/ipython-contrib/IPython-notebook-extensions/tarball/master
RUN pip install fastavro
RUN pip install gspread oauth2client

RUN git clone https://github.com/mysql/mysql-connector-python.git && \
    cd mysql-connector-python && \
    python ./setup.py build && \
    python ./setup.py install && \
    cd ..

RUN pip install sqlalchemy
