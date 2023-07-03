
#remotes::install_github("allisonhorst/palmerpenguins")
library(tidyverse)
library(palmerpenguins)
library(tidymodels)
data(package = 'palmerpenguins')
set.seed(12345) 

penguins <- na.omit(penguins)

penguins_no_species <- penguins %>% 
  select(-species) 

split <- initial_split(penguins, prop = 0.05, strata = species)

toy_penguins <- training(split) %>% 
  mutate(cluster=as_factor(as.numeric(species))) %>% 
  select(-species) 

ggplot(toy_penguins, aes(y = bill_length_mm, x = flipper_length_mm, colour = cluster)) +
  geom_point() +
  xlab("Flipper Length (mm)") +
  ylab("Bill Length (mm)") 

write_csv(toy_penguins, "data/toy_penguins.csv")
write_csv(penguins_no_species, "data/penguins.csv")
