## Script to create variants of state_property_vote.csv
library(tidyverse)


args <- commandArgs(trailingOnly = TRUE)
path <- args[1]

main <- function(){
  data <- read_csv(path)
  path_no_prefix <- sub(".{3}$", "", path)
  
  # file with no column names and tab delimiters
  write_delim(data, 
              path = paste0(path_no_prefix, ".tsv"),
              delim = "\t",
              colnames = FALSE)
  
  
  
}
