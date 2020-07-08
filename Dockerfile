FROM rocker/verse:4.0.0

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
    tidymodels

RUN apt-get install -y emacs