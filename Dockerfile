# Copyright (c) UBC-DSCI Development Team.
FROM rocker/verse:4.1.0

# install system dependencies
RUN apt-get update --fix-missing \
	&& apt-get install -y \
		ca-certificates \
    	libglib2.0-0 \
	 	libxext6 \
	   	libsm6  \
	   	libxrender1 \
		libxml2-dev

# install python3 & virtualenv
RUN apt-get install -y \
		python3-pip \
		python3-dev \
	&& pip3 install virtualenv

# install anaconda & put it in the PATH
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh 
ENV PATH /opt/conda/bin:$PATH

# install rpy2
RUN conda install -y pip && \
    pip install rpy2
ENV LD_LIBRARY_PATH /usr/local/lib/R/lib/:${LD_LIBRARY_PATH}

# install libGLPK
RUN apt-get install libglpk-dev

# install R packages
RUN apt-get update -qq && install2.r --error \
    --deps TRUE \
    tidyverse \
    e1071 \
    caret \
    plotly \
    gridExtra \
    GGally \
    cowplot \
    svglite \
    tidymodels \
    reticulate \ 
    kknn
    
RUN Rscript -e "devtools::install_github('ttimbers/canlang@0.0.1')"

# install LaTeX packages
RUN tlmgr install amsmath \
    latex-amsmath-dev \
    fontspec \
    tipa \
    unicode-math \
    xunicode \
    kvoptions \
    ltxcmds \
    kvsetkeys \
    etoolbox \
    xcolor \
    auxhook \
    bigintcalc \
    bitset \
    etexcmds \
    gettitlestring \
    hycolor \
    hyperref \
    intcalc \
    kvdefinekeys \
    letltxmacro \
    pdfescape \
    refcount \
    rerunfilecheck \
    stringenc \
    uniquecounter \
    zapfding \
    pdftexcmds \
    infwarerr \
    fancyvrb \
    framed \
    booktabs \
    mdwtools \
    grffile \
    caption \
    sourcecodepro \
    amscls \
    natbib
