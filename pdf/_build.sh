# Script to generate bookdown PDF.

# Remove old files
rm intro.Rmd preface-text.Rmd references.Rmd printindex.tex
rm -rf data img

# Copy files
cp ../references.bib .
cp ../preface-text.Rmd .
cp ../intro.Rmd .
cp ../references.Rmd .
cp ../printindex.tex .
cp -r ../data .
cp -r ../img .

# Build the book with bookdown
Rscript _build.r