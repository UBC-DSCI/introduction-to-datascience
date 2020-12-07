## Introduction to Data Science
This is the source for the Introduction to Data Science textbook.

## Setup and Build

1. Install Docker (instructions here: [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/))

2. Run RStudio inside the `ubcdsci/intro-to-ds` docker container:
    - in terminal, navigate to the root of this project repo
    - type the following in terminal:
    ```
    docker run --rm -it -p 8787:8787 -v $PWD:/home/rstudio/introduction-to-datascience -e PASSWORD=password ubcdsci/intro-to-ds:v0.1.0
    ```
    - open a web browser and type [http://localhost:8787/](http://localhost:8787/)
    - for the username enter `rstudio` 
    - for the password enter `password` (or whatever you may have changed it to in the `docker run` command above)
    
    > Note, if you prefer not to use RStudio, but a plain text editor instead (i.e., vim) the see [these docs](#usage-without-rstudio) below.

3. Finally, you can render the book by running the following R code in the R console:
    ```
    bookdown::render_book('index.Rmd', 'bookdown::gitbook')
    ```

> ### Usage without RStudio
> You can use this docker container to edit the files without RStudio using either vim or emacs. This can be done via:
> ```
> docker run --rm -it -v $PWD:/introduction-to-datascience ubcdsci/intro-to-ds /bin/bash
> ```

### Updating the textbook data
Data sets are collected and curated by `data/retrieve_data.ipynb`. To run that notebook in the Docker container type the following in the terminal:

```
docker run --rm -it -p 8888:8888 -v $PWD:/home/rstudio/introduction-to-datascience ubcdsci/intro-to-ds jupyter notebook --ip=0.0.0.0 --allow-root
```

## Style Guide

- For R code block labels, use the format `##-[name with only alphanumeric + hyphens]` where the `##` is the 2-digit chapter number, e.g. `03-test-name` for a label `test-name` in chapter 3

## Repository Organization / Important Files
- The files `index.Rmd` and `##-name.Rmd` are [R-markdown](https://rmarkdown.rstudio.com/) chapter contents to be parsed by [Bookdown](https://bookdown.org/)
- `_bookdown.yml` sets the output directory (`docs/`) and default chapter name
- `img/` contains custom images to be used in the text; note this is not all of the images as some are generated by R code when compiling
- `data/` stores datasets processed during compile
- `docs/.nojekyll` tells github's static site builder not to run [Jekyll](https://jekyllrb.com/). This avoids Jekyll deleting the folder `docs/_main_files` (as it starts with an underscore)

## License Information

[Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
