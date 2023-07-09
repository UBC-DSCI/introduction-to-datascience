# Script to generate HTML book
docker run --rm -m 5g -v $(pwd):/home/rstudio/introduction-to-datascience ubcdsci/intro-to-ds:20230709020300d0b466 /bin/bash -c "cd /home/rstudio/introduction-to-datascience; Rscript -e 'bookdown::render_book(\"index.Rmd\", output_format=\"bookdown::gitbook\"); warnings(); problems()'"
