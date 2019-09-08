## Script to create variants of a plain vanilla .csv file
library(tidyverse)
library(openxlsx)
library(RSQLite)

main <- function(){
  path <- "data/state_property_vote.csv"
  data <- read_csv(path)
  path_no_prefix <- sub(".{4}$", "", path)
  
  # file with some meta data at the top
  meta_data <- data.frame(metadata = c("Data source: https://datausa.io/",
                                   "Record of how data was collected: https://github.com/UBC-DSCI/introduction-to-datascience/blob/master/data/src/retrieve_data_usa.ipynb",
                                   "Date collected: 2017-06-06"))
  write.table(meta_data, 
            file = paste0(path_no_prefix, "_meta-data.csv"),
            sep = ",",
            col.names = FALSE,
            row.names = FALSE,
            quote = FALSE)
  write.table(data, 
            file = paste0(path_no_prefix, "_meta-data.csv"),
            sep = ",",
            row.names = FALSE,
            quote = FALSE,
            append = TRUE)
  
  # file with no column names and tab delimiters
  write_delim(data, 
              path = paste0(path_no_prefix, ".tsv"),
              delim = "\t",
              col_names = FALSE)
  
  # excel file
  write.xlsx(data, file = paste0(path_no_prefix, ".xlsx"))
}

  # write to sqlite
  con <- dbConnect(RSQLite::SQLite(), paste0(path_no_prefix, ".db"))
  dbWriteTable(con, "state", data, overwrite = TRUE)
  dbDisconnect(con)

main()
