# Script to generate HTML book
docker run --rm -m 5g -v $(pwd):/home/rstudio/introduction-to-datascience ubcdsci/intro-to-ds:v0.21.0 /bin/bash -c "cd /home/rstudio/introduction-to-datascience; Rscript _build_html.r"
