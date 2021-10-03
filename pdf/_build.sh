# Script to generate bookdown PDF.

# Remove old files
rm *.Rmd printindex.tex preamble.tex
rm -rf data img

# Copy files
cp ../references.bib .
cp ../index.Rmd .
cp ../intro.Rmd .
cp ../references.Rmd .
cp ../printindex.tex .
cp ../preamble.tex .
cp -r ../data .
cp -r ../img .

# Build the book with bookdown
Rscript _build.r