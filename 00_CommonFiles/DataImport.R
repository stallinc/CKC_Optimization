# Project information

# Title: Optimization of grow‐out culture of Caribbean king crab 

# PI(s): Christopher Stallings

# Code developer(s): Chris Stallings
# Origination Date: 2025-07-31

#### Load packages and operators ####

#### Load packages ####
library(tidyverse)

#### Define helper functions ####

# For size datasets
process_size_data <- function(file_path) {
  read_csv(file_path) %>%
    mutate(
      cw_diff = as.numeric(cw_end) - as.numeric(cw_start),
      mass_diff = as.numeric(mass_end) - as.numeric(mass_start),
      cw_percent = ((as.numeric(cw_end) - as.numeric(cw_start)) / as.numeric(cw_start)) * 100,
      mass_percent = ((as.numeric(mass_end) - as.numeric(mass_start)) / as.numeric(mass_start)) * 100
    )
}

# For time-to-molt datasets
process_ttm_data <- function(file_path) {
  read_csv(file_path) %>%
    mutate(
      time_to_molt = as.numeric(difftime(
        as.Date(molt_date, format = "%m/%d/%Y"),
        as.Date(start_date, format = "%m/%d/%Y"),
        units = "days"
      ))
    )
}

#### Import and process datasets ####




# Time-to-molt datasets
trial1_ttm <- process_ttm_data("00_CommonFiles/Data/trial1_ttm.csv")
trial2_ttm <- process_ttm_data("00_CommonFiles/Data/trial2_ttm.csv")
trial3_ttm <- process_ttm_data("00_CommonFiles/Data/trial3_ttm.csv")

# Size datasets
trial1_size <- process_size_data("00_CommonFiles/Data/trial1_size.csv")
trial2_size <- process_size_data("00_CommonFiles/Data/trial2_size.csv")
trial3_size <- process_size_data("00_CommonFiles/Data/trial3_size.csv")

# ---- Curated molt tables  ----

trial1_molt <- read_csv("00_CommonFiles/Data/trial1_molt.csv", show_col_types = FALSE) |>
  mutate(crabID = as.character(crabID),
         ttt    = factor(ttt),
         molt   = as.integer(molt)) |>
  distinct(crabID, ttt, .keep_all = TRUE)

trial2_molt <- read_csv("00_CommonFiles/Data/trial2_molt.csv", show_col_types = FALSE) |>
  mutate(crabID = as.character(crabID),
         ttt    = factor(ttt),
         molt   = as.integer(molt)) |>
  distinct(crabID, ttt, .keep_all = TRUE)

trial3_molt <- read_csv("00_CommonFiles/Data/trial3_molt.csv", show_col_types = FALSE) |>
  mutate(crabID = as.character(crabID),
         ttt    = factor(ttt),
         molt   = as.integer(molt)) |>
  distinct(crabID, ttt, .keep_all = TRUE)