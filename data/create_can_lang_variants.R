## Script to create variants of a plain vanilla .csv file
library(tidyverse)
library(openxlsx)
library(RSQLite)

devtools::install_github("ttimbers/canlang")
library(canlang)
write_csv(can_lang, "can_lang.csv")

main <- function(){
  path <- "can_lang.csv"
  data <- read_csv(path)
  path_no_prefix <- sub(".{4}$", "", path)
  
  # file with some meta data at the top
  meta_data <- data.frame(metadata = c("Data source: https://ttimbers.github.io/canlang/",
                                   "Data originally published in: Statistics Canada Census of Population 2016.",
                                   "Reproduced and distributed on an as is basis with the permission of Statistics Canada."))
  write.table(meta_data, 
            file = paste0(path_no_prefix, "_meta-data.csv"),
            sep = ",",
            col.names = FALSE,
            row.names = FALSE,
            quote = FALSE)
  write_csv(data, 
            path = paste0(path_no_prefix, "_meta-data.csv"),
            append = TRUE, 
            col_names = TRUE)
  
  # file with no column names and tab delimiters
  write_delim(data, 
              path = paste0(path_no_prefix, ".tsv"),
              delim = "\t",
              col_names = FALSE)
  
  # excel file
  write.xlsx(data, file = paste0(path_no_prefix, ".xlsx"))

  # write to sqlite
  con <- dbConnect(RSQLite::SQLite(), paste0(path_no_prefix, ".db"))
  dbWriteTable(con, "lang", data, overwrite = TRUE)
  dbDisconnect(con)
}

main()
