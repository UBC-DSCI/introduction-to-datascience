# Script to generate bookdown PDF.

# Remove old files
rm preface-text.Rmd \
  intro.Rmd \
  reading.Rmd \
  references.Rmd \
  printindex.tex
rm -rf data img

# Copy files
cp ../references.bib .
cp ../preface-text.Rmd .
cp ../intro.Rmd .
cp ../reading.Rmd .
cp ../references.Rmd .
cp ../printindex.tex .
cp -r ../data .
cp -r ../img .

# Build the book with bookdown
Rscript _build.r