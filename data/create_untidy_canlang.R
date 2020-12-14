## creating untidy canlang data
library(canlang)
library(tidyverse)

# subsetting 5 cities
top5_cities <- region_lang %>% 
  filter(region %in% c("Toronto", "Montréal", "Vancouver", "Calgary", "Edmonton"))

write.csv(top5_cities, "region_lang_top5_cities.csv", row.names = F)

# making a wide data set 
top5_cities_wide <- top5_cities %>% 
  select(region, category, language, mother_tongue) %>% 
  pivot_wider(names_from = region, values_from = c(mother_tongue)) %>% 
  select(category, language, Toronto, Montréal, Vancouver, Calgary, Edmonton)

write.csv(top5_cities_wide, "region_lang_top5_cities_wide.csv", row.names = F)

## making a messy data set with "/" delimiters 
top5_cities_messy <- top5_cities %>% 
  unite(col = "value", most_at_home, most_at_work, sep = "/") %>% 
  select(region, category, language, value) %>% 
  pivot_wider(names_from = region, values_from = value) %>% 
  select(category, language, Toronto, Montréal, Vancouver, Calgary, Edmonton)

write.csv(top5_cities_messy, "region_lang_top5_cities_messy.csv", row.names = F)


# making a narrow data set 
top5_cities_narrow <- top5_cities %>% 
  select(region, category, language, most_at_home, most_at_work) %>% 
  pivot_longer(!c(region, category, language), names_to = "type", values_to = "count")
write.csv(top5_cities_narrow, "region_lang_top5_cities_long.csv", row.names = F)
