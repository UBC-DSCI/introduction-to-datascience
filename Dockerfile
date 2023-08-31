# Copyright (c) UBC-DSCI Development Team.
FROM rocker/verse:4.3.1

RUN apt-get update --fix-missing
RUN Rscript -e "update.packages(ask = FALSE)"
RUN install2.r --error magick \
                       cowplot \
                       kableExtra \
                       plotly \
                       tidymodels \
                       tidyclust \
                       kknn \
                       ggpubr \
                       ggforce \
                       themis \
                       egg \
                       fontawesome \
                       xfun \
                       tinytex \
                       reticulate \
                       rsvg

RUN Rscript -e "devtools::install_github('ttimbers/canlang@0.0.1')"
RUN Rscript -e "reticulate::install_miniconda()"
RUN Rscript -e "reticulate::conda_install('r-reticulate', 'python-kaleido')"
RUN Rscript -e "reticulate::conda_install('r-reticulate', 'plotly', channel = 'plotly')"
# necessary for tuning number of clusters in Kmeans
# see https://github.com/tidymodels/tidyclust/issues/127
RUN apt install -y libgsl27

# increase the ImageMagick resource limits
# this relies on the fact that there is only one place where each of these sizes are used in policy.xml
# (256MiB is for memory, 512MiB is for map, 1GiB is for disk)
RUN sed -i 's/256MiB/8GiB/' /etc/ImageMagick-6/policy.xml
RUN sed -i 's/512MiB/8GiB/' /etc/ImageMagick-6/policy.xml
RUN sed -i 's/1GiB/8GiB/' /etc/ImageMagick-6/policy.xml

## install LaTeX packages
RUN tlmgr install \
    amsmath \
    latex-amsmath-dev \
    iftex \
    euenc \
    fontspec \
    tipa \
    unicode-math \
    xunicode \
    kvoptions \
    ltxcmds \
    kvsetkeys \
    etoolbox \
    xcolor \
    fancyvrb \
    framed \
    booktabs \
    mdwtools \
    float \
    caption \
    sourcecodepro \
    hyperref \
    amscls \
    multirow \
    wrapfig \
    colortbl \
    pdflscape \
    tabu \
    varwidth \
    threeparttable \
    threeparttablex \
    environ \
    trimspaces \
    ulem \
    makecell \
    natbib \
    pdftexcmds \
    infwarerr \
    fontawesome5
