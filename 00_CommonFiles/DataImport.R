# Project information

# Title: Estimating combined effects of FL TIG restoration projects in Florida using an end-to-end ecosystem model

# PI(s): Drs. Cameron Ainsworth, Christopher Stallings

# Code developer(s): Michael Schram 
# Origination Date: 2023-09-20

#### Load packages and operators ####

# Load required packages
library(tidyverse)

# Define a helper function to import and process each dataset
process_data <- function(file_path) {
  read_csv(file_path) %>%
    mutate(
      cw_diff = as.numeric(cw_end) - as.numeric(cw_start),
      mass_diff = as.numeric(mass_end) - as.numeric(mass_start),
      cw_percent = (as.numeric(cw_end) - as.numeric(cw_start)) / as.numeric(cw_start),
      mass_percent = (as.numeric(mass_end) - as.numeric(mass_start)) / as.numeric(mass_start)/
      as.numeric(mass_start),
      time_to_molt = as.numeric(difftime(as.Date(molt_date, format = "%m/%d/%Y"),
                                         as.Date(start_date, format = "%m/%d/%Y"),
                                         units = "days"))
      
    )
}


# Import and process each dataset
dat_expt1 <- process_data("00_CommonFiles/Data/dat_expt1_food.csv")
dat_expt2 <- process_data("00_CommonFiles/Data/dat_expt2_photo.csv")
dat_expt3 <- process_data("00_CommonFiles/Data/dat_expt3_space.csv")

