## creating untidy canlang data
library(canlang)
library(tidyverse)


# making a wide data set 
top5_cities <- region_lang %>% 
  filter(region %in% c("Toronto", "Montréal", "Vancouver", "Calgary", "Edmonton"))

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





region_joined <- left_join(region_lang, region_data, by = "region")

top5_cities_pop <- region_joined %>% 
  filter(region %in% c("Toronto", "Montréal", "Vancouver", "Calgary", "Edmonton"))


top5_cities_messy <- top5_cities_pop %>%   
  select(region, category, language, mother_tongue, population) %>% 
  unite("value", mother_tongue, population, sep = "/") %>% 
  pivot_wider(names_from = region, values_from = c(value)) %>% 
  select(category, language, Toronto, Montréal, Vancouver, Calgary, Edmonton)




# making a narrow data set 
top5_cities_narrow <- top5_cities %>% 
  pivot_longer(!c(region, category, language), names_to = "type", values_to = "count")

write.csv(top5_cities_narrow, "region_lang_top5_cities_narrow.csv", row.names = F)
