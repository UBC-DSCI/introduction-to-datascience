
#remotes::install_github("allisonhorst/palmerpenguins")
library(tidyverse)
library(palmerpenguins)
data(package = 'palmerpenguins')
set.seed(11200) 

penguins_no_species <- penguins %>% 
  select(-species) %>% 
  na.omit()

toy_penguins <- penguins %>%
  mutate(cluster=as_factor(as.numeric(species))) %>% 
  select(-species) %>% 
  na.omit() %>%  
  sample_n(20)


ggplot(toy_penguins, aes(y = bill_length_mm, x = flipper_length_mm, colour = cluster)) +
  geom_point() +
  xlab("Flipper Length (mm)") +
  ylab("Bill Length (mm)") 

write_csv(toy_penguins, "data/toy_penguins.csv")
write_csv(penguins_no_species, "data/penguins.csv")
