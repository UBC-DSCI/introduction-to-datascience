library(tidyverse)

co2_df <- data.frame(concentration = as.matrix(co2), date = time(co2))
write_csv(co2_df, '../maunaloa.csv')

islands_df <- enframe(islands)
colnames(islands_df) <- c('landmass', 'size')
write_csv(islands_df, '../islands.csv')


