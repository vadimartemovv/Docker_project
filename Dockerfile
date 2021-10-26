FROM nvidia/cuda:9.0-base


RUN apt update && apt install -y wget unzip curl bzip2 git
RUN curl -LO http://repo.continuum.io/archive/Anaconda3-2.5.0-Linux-x86_64.sh
RUN bash Anaconda3-2.5.0-Linux-x86_64.sh -p /anaconda3 -b
RUN rm Anaconda3-2.5.0-Linux-x86_64.sh
ENV PATH=/anaconda3/bin:${PATH}

RUN conda update conda

RUN conda install tensorflow
RUN conda install tensorflow-gpu
RUN mkdir /usr1/ && cd /usr1/
COPY . /usr1/

WORKDIR /usr1/pointwise/

COPY run_container.sh .

ENTRYPOINT ["/run_container.sh"]


