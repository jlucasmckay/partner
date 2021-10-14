# load.R

# load csv data
library(tidyverse)
redcap_data = read_csv("/Users/lucasmckay/Downloads/PARTNERPRRInPAD-MinglunsReport_DATA_2021-10-14_1006.csv")

redcap_data = redcap_data |> 
  mutate(sex = case_when(
    sex___1 == TRUE ~ "Male",
    sex___2 == TRUE ~ "Female",    
  )) |> 
  select(participants, starts_with("redcap"), age, sex, moca_total, everything()) |> 
  group_by(participants) |> 
  fill(age,.direction = "downup") |> 
  fill(sex,.direction = "downup") |> 
  ungroup()

baseline_data = redcap_data |> filter(grepl("aseline",redcap_event_name))