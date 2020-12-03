## creating untidy canlang data
library(canlang)
library(tidyverse)

  
top5_cities <- region_lang %>% 
  filter(region %in% c("Toronto", "Montreal", "Vancouver", "Calgary", "Edmonton"))

top5_cities_wide <- top5_cities %>% 
  select(region, category, language, mother_tongue) %>% 
  pivot_wider(names_from = region, values_from = c(mother_tongue))

write.csv(top5_cities_wide, "region_lang_top5_cities_wide.csv", row.names = F)

top5_cities_narrow <- top5_cities %>% 
  pivot_longer(!c(region, category, language), names_to = "type", values_to = "count")

write.csv(top5_cities_narrow, "region_lang_top5_cities_narrow.csv", row.names = F)

