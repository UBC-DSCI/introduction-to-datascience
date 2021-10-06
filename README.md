## Introduction to Data Science
This is the source for the Introduction to Data Science textbook.

## Setup and Build to html

In order to build the book, you need to first install Docker 
(instructions here: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)).
Then obtain the build image via
```
docker pull ubcdsci/intro-to-ds
```
From this point you have two options:

- use whatever text editor you want, and build the book on the command line
- use RStudio to both edit and build the book

We provide instructions for both methods here.

### Without RStudio

To build the **html version** of the book, navigate to the repository root folder and run
```
./build.sh
``` 
from the command line. This command automatically spawns a docker container
with the `ubcdsci/intro-to-ds` image, runs the script `build.R` from within the container,
and then stops the container. It may ask you for a password; this is the password for the
`sudo` command on your computer. Typically this is just your usual computer user account password.
But if your setup doesn't require you to use `sudo` to start a docker container, you can just
open `build.sh` and delete the word `sudo` at the start of the script.

To build the **PDF version** of the book, instead run
```
./pdfbuild.sh
```
The same comments regarding passwords and `sudo` as above apply here.

### With RStudio

1. Run RStudio inside the `ubcdsci/intro-to-ds` docker container:
    - in terminal, navigate to the root of this project repo
    - type the following in terminal:

    ```
    docker-compose up -d
    ```
    If you use this, then when you are done working, type `docker-compose down` to remove the dangling container.
    

    > Alternatively, you can type:
    > ```
    > docker run --rm -it -p 8787:8787 -m 4g -v $PWD:/home/rstudio/introduction-to-datascience -e PASSWORD=password ubcdsci/intro-to-ds:v0.1.0
    > ```
    
    Next:
    - open a web browser and type [http://localhost:8787/](http://localhost:8787/)
    - for the username enter `rstudio` 
    - for the password enter `password` (or whatever you may have changed it to in the `docker run` command above)
    
3. Finally, you can render the book by running the following R code in the R console:
    ```
    bookdown::render_book('index.Rmd', 'bookdown::gitbook')
    ```

## Setup and Build to pdf

1. Run `bash _build-pdf.sh` (note: this script does not have sudo in it)

## Style Guide

#### General
- **80 character line limit!** This is necessary to make git diffs useful
- numbers in text should be english words ("four common mistakes" not "4 common mistakes") unless there are units (40km, not forty km)
- use Oxford commas ("a, b, and c" not "a, b and c")
- "subset" should not be used as a verb
- functions in text should not have parentheses (`read_csv` not `read_csv()`)
- remove all references to "course" and "student"; replace with "reader" or "you" where necessary
- make sure we have permission to use all external resources that we use
- remove all references to "clicking on things" in the HTML version of the book (e.g. "click this link to ...")
- When we introduce a new term, use `**bolding**` to typeset it (but only the first introduction of the term)
- for symbols as part of the text, make sure you give them their full name and surround with parentheses so that they
  don't "disappear" in the rest of the text. So for example, if I have a `,` in the text, I should do
  something like  "here is some text about the comma (`,`)". Or for `<-`, we should do "something like this assignment operator (`<-`)".
  There are likely exceptions to this rule though.
- Book titles in the text should be typeset in italics (e.g. *R for Data Science*)

#### Code blocks
- Use the knitr label format `##-[name with only alphanumeric + hyphens]` where 
  the `##` is the 2-digit chapter number, e.g. `03-test-name` for a label `test-name` in chapter 3
- Make sure to get syntax highlighting by specifying the language in each code block:
  <pre>
  ```r
     code
  ```
  </pre>
  not
  <pre>
  ```
    code
  ```
  (similar for `html` where needed)
- always use `|>` pipe, not `%>%`
- anywhere we specify a grid of tuning values, don't just do `grid = 10`; actually specify the values using `seq` or `c(...)`
- do not end code blocks with `head(dataframe)`; just use `dataframe` to print
- `set.seed` once at the beginning of each chapter
- use `"double quotes"` for strings, not `'single quotes'`
- make sure all lines of code are at most 80 characters (for LaTeX PDF output typesetting)
- pass code blocks through `styler` (although must obey the 80ch limit)
- use `slice`, `slice_min`, `slice_max` (not `top_n`)
- just `pull(colname)`, don't `select` first

#### Section headings
- All (sub)section headings should be sentence case ("Loading a tabular data set", not "Loading a Tabular Data Set")
- Make sure that subsections occur in 1-step hierarchies (no subsubsection directly below subsection, for example)
- Make sure that `{-}` is used wherever unnumbered headings are required

Choose an appropriate table of contents depth via (example has depth 2 below, which is a good default)
```
bookdown::gitbook:
    toc_depth: 2
```

#### Learning objectives
- when saying that students will do things in code, always say "in R"
- "you will be able to" (not "students will be able to", "the reader will be able to")

#### Equations
- make sure all equations get capitalized labels ("Equation \\@ref(blah)", not "equation below" or "equation above")

#### Figures
- make sure all figures get (capitalized) labels ("Figure \\@ref(blah)", not "figure below" or "figure above")
- make sure all figures get captions
- specify image widths in terms of linewidth percent (e.g. `out.width="70%"`)
- center align all images via `fig.align = "center"`
- make sure we have permission for every figure/logo that we use
- Make sure all figures follow the visualization principles in Chapter 4
- Make sure axes are set appropriately to not inflate/deflate differences artificially *where it does not compromise clarity* (e.g. in the classification
  chapter there are a few examples where zoomed-in accuracy axes are better than using the full range 0 to 1)
- 

#### Tables
- make sure all tables get capitalized labels ("Table \\@ref(blah)", not "table below" or "table above")
- make sure all tables get captions
- make sure the row + column spacing is reasonable
- Do not put links in table captions, it breaks pdf rendering
- Do not put underscores in table captions, it breaks pdf rendering

#### Note boxes
- note boxes should be typeset as quote boxes using `>` and start with **Note:**

#### Bibliography
- do not put "et al" or "and others"; always use the full list of authors, BibTeX will choose how to abbreviate

#### Naming conventions
- K-means (not $K$-\*, K means, Kmeans)
- K-nearest neighbors (not $K$-\*, K nearest neighbors, K nearest neighbor, use US spelling neighbor not neighbour). Note that "K-nearest neighbor" is not the singular form; "K-nearest neighbors" is
- K-NN (not $K$-\*, KNN, K NN, $K$NN, K-nn)
- local repository (not local computer)
- package (not library, meta package, meta-package)
- data science (not Data Science)
- data frame (not dataframe)
- data set (not dataset)
- scatter plot (not scatterplot)
- bar plot (not bar chart)
- capitalize all initialisms and acronyms (URL not url, API not api, K-NN not k-nn)
- response variable (not target, output, label)
- predictor variable (not explanatory, feature)
- numerical variable (not quantitative variable)
- categorical variable (not class variable)

#### Punctuation
- emdashes should have no surrounding spaces. `This kind of typesetting&mdash;which is awesome&mdash;is correct!` and `Typesetting with spaces around em-dashes &mdash; which is bad &mdash; is not correct`
- make sure `\index` commands don't break punctuation spacing. E.g. `This is an item \index{item}; it is good` will typeset with an erroneous space after item, i.e. `This is an item ; it is good`

#### Common typos to check for
- RMPSE: should be RMSPE
- boostrap: should be bootstrap

#### Use American spelling
Generally the book uses American spelling. Some common British vs American and Canadian vs American gotchas:
- o vs ou: neighbor and color (not neighbour and colour)
- single vs double ell: labeling and labeled (not labelling and labelled)
- z vs s: summarize (not summarise)
- c vs s: defense (not defence)
- er vs re: center (not centre)

#### Whitespace
We need a line of whitespace before and after. This is for readability, 
and it is essential for figure captions.

#### PDF Output
These are absolute last steps when rendering the PDF output:
- Look for and fix bad line breaks (e.g. with only one word on the next line, orphans, and widows)
- Look for and fix bad line wraps in code and text
- Look for and fix bad figure placement (falling off page, going over the side)
- Look for and fix large whitespace sections where LaTeX doesn't want to break the next paragraph (usually `\allowdisplaybreaks` helps)
- Fix incorrect indenting. LaTeX will indent for a new paragraph if there is an extra whitespace line, so these should be deleted if no paragraph break is desired.
- Look for `??` in the PDF (broken refs)
- Look in the index for near-duplicates, and merge if needed
- Look for / fix raw LaTeX code (search for backslash and curly brace in the final PDF)
- Make sure the 3D figures (and the text around them that refers to clicking and dragging) are properly modified for the PDF output
- Make sure all markdown label-replaced URLs (of the form `[blah](url)`) will make 
  sense in the hardcopy book version (i.e. nothing like "click this"). Many links appear in the additional resources: make sure the 
  text-replacement of the URL contains enough information for someone to find the resource (without being able to click the link)

#### HTML Output
- Look for broken references (I *think* these end up as `??`)
- Look for uncentered images

## Updating the textbook data
Data sets are collected and curated by `data/retrieve_data.ipynb`. To run that notebook in the Docker container type the following in the terminal:

```
docker run --rm -it -p 8888:8888 -v $PWD:/home/rstudio/introduction-to-datascience ubcdsci/intro-to-ds jupyter notebook --ip=0.0.0.0 --allow-root
```

## Repository Organization / Important Files
- The files `index.Rmd` and `##-name.Rmd` are [R-markdown](https://rmarkdown.rstudio.com/) chapter contents to be parsed by [Bookdown](https://bookdown.org/)
- `_bookdown.yml` sets the output directory (`docs/`) and default chapter name
- `img/` contains custom images to be used in the text; note this is not all of the images as some are generated by R code when compiling
- `data/` stores datasets processed during compile
- `docs/.nojekyll` tells github's static site builder not to run [Jekyll](https://jekyllrb.com/). This avoids Jekyll deleting the folder `docs/_main_files` (as it starts with an underscore)

## License Information

[Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
