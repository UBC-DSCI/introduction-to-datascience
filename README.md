## Introduction to Data Science
This is the source for the Introduction to Data Science textbook.

## Setup and Build

First, you need to ensure the following libraries/executables are available on your system (the below is for Ubuntu OS; if you aren't on Ubuntu, just run the below `install.packages(...)` command and it will throw errors telling you what to install for your OS)

`
sudo apt-get pandoc, pandoc-citeproc, libssl-dev, libxml2-dev
`
Then before rendering the book, you need to install a collection of R packages:
`
install.packages(c("e1071", "rvest", "tidyverse", "caret", "bookdown", "plotly", "gridExtra", "GGally"))
`
Finally, you can render the book with the following R code:
`
bookdown::render_book('index.Rmd', 'bookdown::gitbook')
`
