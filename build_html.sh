# Script to generate HTML book
docker run --rm -m 8g -v $(pwd):/home/rstudio/introduction-to-datascience ubcdsci/intro-to-ds:202307130106229dd1c2 /bin/bash -c "cd /home/rstudio/introduction-to-datascience; Rscript -e 'bookdown::render_book(\"index.Rmd\", output_format=\"bookdown::gitbook\"); warnings(); problems()'"

