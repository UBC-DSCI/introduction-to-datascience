# Script to generate PDF book

# Copy files
cp references.bib pdf/
cp preface-text.Rmd pdf/
cp intro.Rmd pdf/
cp reading.Rmd pdf/
cp wrangling.Rmd pdf/
cp viz.Rmd pdf/
cp classification1.Rmd pdf/
cp classification2.Rmd pdf/
cp regression1.Rmd pdf/
cp regression2.Rmd pdf/
cp clustering.Rmd pdf/
cp inference.Rmd pdf/
cp jupyter.Rmd pdf/
cp version-control.Rmd pdf/
cp setup.Rmd pdf/
cp references.Rmd pdf/
cp printindex.tex pdf/
cp -r data/ pdf/data
cp -r img/ pdf/img

# Build the book with bookdown
docker run --rm -m 5g -v $(pwd):/home/rstudio/introduction-to-datascience ubcdsci/intro-to-ds:v0.16.0 /bin/bash -c "cd /home/rstudio/introduction-to-datascience/pdf; Rscript _build_pdf.r"

# clean files in pdf dir
rm -rf pdf/references.bib
rm -rf pdf/preface-text.Rmd 
rm -rf pdf/intro.Rmd 
rm -rf pdf/reading.Rmd 
rm -rf pdf/wrangling.Rmd 
rm -rf pdf/viz.Rmd 
rm -rf pdf/classification1.Rmd 
rm -rf pdf/classification2.Rmd 
rm -rf pdf/regression1.Rmd 
rm -rf pdf/regression2.Rmd 
rm -rf pdf/clustering.Rmd 
rm -rf pdf/inference.Rmd 
rm -rf pdf/jupyter.Rmd 
rm -rf pdf/version-control.Rmd 
rm -rf pdf/setup.Rmd 
rm -rf pdf/references.Rmd 
rm -rf pdf/printindex.tex
rm -rf pdf/data pdf/img

