library(tidyverse)

wd <- read_csv('../data/wdbc.csv')

wd <- wd %>% select(Class, Smoothness, Concavity)
for (i in 1:500) {
    wd <- wd %>% 
	add_column( !!paste("Irrelevant", i, sep="") := sample(1000000, size=nrow(wd), replace=TRUE)/1000000)
}

write_csv(wd, '../data/wdbc_irrelevant.csv')

