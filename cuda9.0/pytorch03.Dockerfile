FROM acha21/cuda9.0

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update

RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-4.6.14-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-4.6.14-Linux-x86_64.sh  -b \
    && rm -f Miniconda3-4.6.14-Linux-x86_64.sh

RUN conda --version

RUN conda install pytorch=0.3.1 cuda90 -c pytorch
RUN conda install torchvision -c pytorch
