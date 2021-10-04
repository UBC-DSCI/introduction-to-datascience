# Script to generate bookdown PDF.

# Remove old files
rm preface-text.Rmd \
  intro.Rmd \
  reading.Rmd \
  wrangling.Rmd \
  viz.Rmd \
  classification1.Rmd \
  classification2.Rmd \
  regression1.Rmd \
  regression2.Rmd \
  clustering.Rmd \
  inference.Rmd \
  jupyter.Rmd \
  version-control.Rmd \
  setup.Rmd .
  references.Rmd \
  printindex.tex
rm -rf data img

# Copy files
cp ../references.bib .
cp ../preface-text.Rmd .
cp ../intro.Rmd .
cp ../reading.Rmd .
cp ../wrangling.Rmd .
cp ../viz.Rmd .
cp ../classification1.Rmd .
cp ../classification2.Rmd .
cp ../regression1.Rmd .
cp ../regression2.Rmd .
cp ../clustering.Rmd .
cp ../inference.Rmd .
cp ../jupyter.Rmd .
cp ../version-control.Rmd .
cp ../setup.Rmd .
cp ../references.Rmd .
cp ../printindex.tex .
cp -r ../data .
cp -r ../img .

# Build the book with bookdown
Rscript _build.r

# clean Rmd files in pdf dir
rm preface-text.Rmd \
  intro.Rmd \
  reading.Rmd \
  wrangling.Rmd \
  viz.Rmd \
  classification1.Rmd \
  classification2.Rmd \
  regression1.Rmd \
  regression2.Rmd \
  clustering.Rmd \
  inference.Rmd \
  jupyter.Rmd \
  version-control.Rmd \
  setup.Rmd .
  references.Rmd \
  printindex.tex
rm -rf data img
