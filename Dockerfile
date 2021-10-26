FROM nvidia/cuda:9.0-base

RUN apt update && apt install -y wget unzip curl bzip2 git
RUN curl -LO http://repo.continuum.io/archive/Anaconda3-2.5.0-Linux-x86_64.sh
RUN bash Anaconda3-2.5.0-Linux-x86_64.sh -p /anaconda3 -b
RUN rm Anaconda3-2.5.0-Linux-x86_64.sh
ENV PATH=/anaconda3/bin:${PATH}

RUN conda install python=3.6.5
RUN conda install tensorflow=1.9.0
RUN conda install tensorflow-gpu=1.9.0 cudatoolkit=9.0
RUN mkdir /usr/ && cd /usr/ && cp ../pointwise /usr/

WORKDIR /usr/pointwise/

COPY run_container.sh .

ENTRYPOINT ["/run_container.sh"]


