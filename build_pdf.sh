# Script to generate PDF book

# Build the book with bookdown
docker run --rm -m 5g -v $(pwd):/home/rstudio/introduction-to-datascience ubcdsci/intro-to-ds:v0.23.0 /bin/bash -c "cd /home/rstudio/introduction-to-datascience; Rscript -e bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"


