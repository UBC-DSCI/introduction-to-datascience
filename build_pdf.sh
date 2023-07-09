# Script to generate PDF book

# backup original index.Rmd
cp index.Rmd index_backup.Rmd

# bookdown does weird things with the root .html filename if either (1) index.rmd is not in the root dir or (2) index.rmd does not contain a heading
# we need the root file to be named index.html, so we need it to be in the root dir and contain a heading. But the PDF version doesn't need the welcome
# page, which is the first heading. So we manually extract that text prior to building. This is a bit painful, but it works...
sed -n -i "/# Welcome/q;p" index.Rmd 

# need to also remove the cover image from the PDF version
sed -i "/graphic\.jpg/d" index.Rmd

## Build the book with bookdown
docker run --rm -m 5g -v $(pwd):/home/rstudio/introduction-to-datascience ubcdsci/intro-to-ds:20230709020300d0b466.23.0 /bin/bash -c "cd /home/rstudio/introduction-to-datascience; Rscript -e 'bookdown::render_book(\"index.Rmd\", \"bookdown::pdf_book\"); warnings(); problems()'"

# restore the backed up full index.Rmd
mv index_backup.Rmd index.Rmd


