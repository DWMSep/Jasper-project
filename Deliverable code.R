# packages install

install.packages("tidyverse")
install.packages("ggplot2")

# libraries

library(tidyverse)
library(ggplot2)

# Reading in csv

Jp <- read.csv("R_Deliverable.csv")
jp <- Jp

# summary of the data with all the headings and characters

Jp

# tidying up the data
# change the names in colour and add back to Jp

Jp$colour[Jp$colour == "red - green"] <- "red_green"
Jp$colour[Jp$colour == "green-green"] <- "green_green"

# ignoring all 0.0 values

Jp <- Jp %>% filter(temp_bef != 0.0, temp_aft != 0.0, temp_change != 0.0)

# tidying the data and making the boxplot

Jp %>%
  group_by(colour) %>%
    select(!c("pair", "number", "shoot", "temp_ctr", "wet_weight", "time", "shoot_flower", "dry_weight")) %>% # removing the columns that are not needed
      pivot_longer(cols = c("temp_bef", "temp_aft", "temp_change"),
      names_to = "variable", values_to = "Temperature") %>% # making the data long            
        ggplot() +     
        geom_boxplot(aes(y = Temperature, x = colour)) + # making the boxplot to hae the temperature on the y axis and the colour on the x axis                          
        theme(axis.text.x = element_text(angle = 45, hjust = 1))                                                       +      
        facet_wrap(vars(variable), scales = "free") # facet_wrap to have the boxplot for each variable         



                      
