library(tidyverse)
library(readxl)
library(lubridate)


download.file("https://www.fdle.state.fl.us/getattachment/CJAB/UCR/Annual-Reports/FIBRS/FIBRS_Offense_Detail_2024_Q2.xlsx.aspx?lang=en-US","fibrs2024.xlsx")
download.file("https://www.fdle.state.fl.us/getattachment/CJAB/UCR/Annual-Reports/FIBRS/FIBRS_Offense_Detail_2023.xlsx.aspx?lang=en-US","fibrs2023.xlsx")
download.file("https://www.fdle.state.fl.us/getattachment/CJAB/UCR/Annual-Reports/FIBRS/FIBRS_Offense_Detail_2022.xlsx.aspx?lang=en-US","fibrs2022.xlsx")
download.file("https://www.fdle.state.fl.us/getattachment/CJAB/UCR/Annual-Reports/FIBRS/FIBRS_Offense_Detail_2021.xlsx.aspx?lang=en-US","fibrs2021.xlsx")

# Import each of the four spreadsheets, skipping first three rows and inserting a row for column names
fibrs2024 <- read_excel("fibrs2024.xlsx", skip = 3, col_names = FALSE) %>% 
  mutate_all(~str_replace(., "--", "0")) %>%
  set_names(c("county", "agency", "population", "quarters_reported", "violent_2024", "violent_2024_rate",
              "property_2024", "property_2024_rate", "other_2024", "other_2024_rate",
              "murder_q1", "murder_q2", "murder_q3", "murder_q4", "murder_2024", "murder_2024_rate",
              "rape_q1", "rape_q2", "rape_q3", "rape_q4", "rape_2024", "rape_2024_rate",
              "robbery_q1", "robbery_q2", "robbery_q3", "robbery_q4", "robbery_2024", "robbery_2024_rate",
              "assault_q1", "assault_q2", "assault_q3", "assault_q4", "assault_2024", "assault_2024_rate",
              "burglary_q1", "burglary_q2", "burglary_q3", "burglary_q4", "burglary_2024", "burglary_2024_rate",
              "larceny_pick_q1", "larceny_pick_q2", "larceny_pick_q3", "larceny_pick_q4", "larceny_pick_2024", "larceny_pick_2024_rate",
              "larceny_purse_q1", "larceny_purse_q2", "larceny_purse_q3", "larceny_purse_q4", "larceny_purse_2024", "larceny_purse_2024_rate",
              "larceny_shoplifting_q1", "larceny_shoplifting_q2", "larceny_shoplifting_q3", "larceny_shoplifting_q4", "larceny_shoplifting_2024", "larceny_shoplifting_2024_rate",
              "larceny_fromvehicle_q1", "larceny_fromvehicle_q2", "larceny_fromvehicle_q3", "larceny_fromvehicle_q4", "larceny_fromvehicle_2024", "larceny_fromvehicle_2024_rate",
              "larceny_vehicleparts_q1", "larceny_vehicleparts_q2", "larceny_vehicleparts_q3", "larceny_vehicleparts_q4", "larceny_vehicleparts_2024", "larceny_vehicleparts_2024_rate",
              "larceny_frombuilding_q1", "larceny_frombuilding_q2", "larceny_frombuilding_q3", "larceny_frombuilding_q4", "larceny_frombuilding_2024", "larceny_frombuilding_2024_rate",
              "larceny_coinmachine_q1", "larceny_coinmachine_q2", "larceny_coinmachine_q3", "larceny_coinmachine_q4", "larceny_coinmachine_2024", "larceny_coinmachine_2024_rate",
              "larceny_other_q1", "larceny_other_q2", "larceny_other_q3", "larceny_other_q4", "larceny_other_2024", "larceny_other_2024_rate",
              "autotheft_q1", "autotheft_q2", "autotheft_q3", "autotheft_q4", "autotheft_2024", "autotheft_2024_rate",
              "negmanslaughter_q1", "negmanslaughter_q2", "negmanslaughter_q3", "negmanslaughter_q4", "negmanslaughter_2024", "negmanslaughter_2024_rate",
              "arson_q1", "arson_q2", "arson_q3", "arson_q4", "arson_2024", "arson_2024_rate",
              "simple_assault_q1", "simple_assault_q2", "simple_assault_q3", "simple_assault_q4", "simple_assault_2024", "simple_assault_2024_rate",
              "stalking_q1", "stalking_q2", "stalking_q3", "stalking_q4", "stalking_2024", "stalking_2024_rate",
              "intimidation_q1", "intimidation_q2", "intimidation_q3", "intimidation_q4", "intimidation_2024", "intimidation_2024_rate",
              "kidnapping_q1", "kidnapping_q2", "kidnapping_q3", "kidnapping_q4", "kidnapping_2024", "kidnapping_2024_rate",
              "drugs_q1", "drugs_q2", "drugs_q3", "drugs_q4", "drugs_2024", "drugs_2024_rate",
              "bribery_q1", "bribery_q2", "bribery_q3", "bribery_q4", "bribery_2024", "bribery_2024_rate",
              "embezzlement_q1", "embezzlement_q2", "embezzlement_q3", "embezzlement_q4", "embezzlement_2024", "embezzlement_2024_rate",
              "fraud_q1", "fraud_q2", "fraud_q3", "fraud_q4", "fraud_2024", "fraud_2024_rate",
              "counterfeit_forgery_q1", "counterfeit_forgery_q2", "counterfeit_forgery_q3", "counterfeit_forgery_q4", "counterfeit_forgery_2024", "counterfeit_forgery_2024_rate",
              "extortion_q1", "extortion_q2", "extortion_q3", "extortion_q4", "extortion_2024", "extortion_2024_rate",
              "prostitution_q1", "prostitution_q2", "prostitution_q3", "prostitution_q4", "prostitution_2024", "prostitution_2024_rate",
              "nonforcible_sex_offenses_q1", "nonforcible_sex_offenses_q2", "nonforcible_sex_offenses_q3", "nonforcible_sex_offenses_q4", "nonforcible_sex_offenses_2024", "nonforcible_sex_offenses_2024_rate",
              "stolen_property_q1", "stolen_property_q2", "stolen_property_q3", "stolen_property_q4", "stolen_property_2024", "stolen_property_2024_rate",
              "vandalism_q1", "vandalism_q2", "vandalism_q3", "vandalism_q4", "vandalism_2024", "vandalism_2024_rate",
              "gambling_q1", "gambling_q2", "gambling_q3", "gambling_q4", "gambling_2024", "gambling_2024_rate",
              "weapons_q1", "weapons_q2", "weapons_q3", "weapons_q4", "weapons_2024", "weapons_2024_rate",
              "identity_q1", "identity_q2", "identity_q3", "identity_q4", "identity_2024", "identity_2024_rate",
              "hacking_q1", "hacking_q2", "hacking_q3", "hacking_q4", "hacking_2024", "hacking_2024_rate",
              "human_trafficking_sex_q1", "human_trafficking_sex_q2", "human_trafficking_sex_q3", "human_trafficking_sex_q4", "human_trafficking_sex_2024", "human_trafficking_sex_2024_rate",
              "human_trafficking_servitude_q1", "human_trafficking_servitude_q2", "human_trafficking_servitude_q3", "human_trafficking_servitude_q4", "human_trafficking_servitude_2024", "human_trafficking_servitude_2024_rate",
              "animal_cruelty_q1", "animal_cruelty_q2", "animal_cruelty_q3", "animal_cruelty_q4", "animal_cruelty_2024", "animal_cruelty_2024_rate"))
# Change columns 3:232 to numeric
fibrs2024[,3:232] <- sapply(fibrs2024[,3:232], as.numeric)


# Import each of the four spreadsheets, skipping first three rows and inserting a row for column names
fibrs2023 <- read_excel("fibrs2023.xlsx", skip = 3, col_names = FALSE) %>% 
  mutate_all(~str_replace(., "--", "0")) %>%
  set_names(c("county", "agency", "population", "quarters_reported", "violent_2023", "violent_2024_rate",
              "property_2023", "property_2023_rate", "other_2023", "other_2023_rate",
              "murder_q1", "murder_q2", "murder_q3", "murder_q4", "murder_2023", "murder_2023_rate",
              "rape_q1", "rape_q2", "rape_q3", "rape_q4", "rape_2023", "rape_2023_rate",
              "robbery_q1", "robbery_q2", "robbery_q3", "robbery_q4", "robbery_2023", "robbery_2023_rate",
              "assault_q1", "assault_q2", "assault_q3", "assault_q4", "assault_2023", "assault_2023_rate",
              "burglary_q1", "burglary_q2", "burglary_q3", "burglary_q4", "burglary_2023", "burglary_2023_rate",
              "larceny_pick_q1", "larceny_pick_q2", "larceny_pick_q3", "larceny_pick_q4", "larceny_pick_2023", "larceny_pick_2023_rate",
              "larceny_purse_q1", "larceny_purse_q2", "larceny_purse_q3", "larceny_purse_q4", "larceny_purse_2023", "larceny_purse_2023_rate",
              "larceny_shoplifting_q1", "larceny_shoplifting_q2", "larceny_shoplifting_q3", "larceny_shoplifting_q4", "larceny_shoplifting_2023", "larceny_shoplifting_2023_rate",
              "larceny_fromvehicle_q1", "larceny_fromvehicle_q2", "larceny_fromvehicle_q3", "larceny_fromvehicle_q4", "larceny_fromvehicle_2023", "larceny_fromvehicle_2023_rate",
              "larceny_vehicleparts_q1", "larceny_vehicleparts_q2", "larceny_vehicleparts_q3", "larceny_vehicleparts_q4", "larceny_vehicleparts_2023", "larceny_vehicleparts_2023_rate",
              "larceny_frombuilding_q1", "larceny_frombuilding_q2", "larceny_frombuilding_q3", "larceny_frombuilding_q4", "larceny_frombuilding_2023", "larceny_frombuilding_2023_rate",
              "larceny_coinmachine_q1", "larceny_coinmachine_q2", "larceny_coinmachine_q3", "larceny_coinmachine_q4", "larceny_coinmachine_2023", "larceny_coinmachine_2023_rate",
              "larceny_other_q1", "larceny_other_q2", "larceny_other_q3", "larceny_other_q4", "larceny_other_2023", "larceny_other_2023_rate",
              "autotheft_q1", "autotheft_q2", "autotheft_q3", "autotheft_q4", "autotheft_2023", "autotheft_2023_rate",
              "negmanslaughter_q1", "negmanslaughter_q2", "negmanslaughter_q3", "negmanslaughter_q4", "negmanslaughter_2023", "negmanslaughter_2023_rate",
              "arson_q1", "arson_q2", "arson_q3", "arson_q4", "arson_2023", "arson_2023_rate",
              "simple_assault_q1", "simple_assault_q2", "simple_assault_q3", "simple_assault_q4", "simple_assault_2023", "simple_assault_2023_rate",
              "stalking_q1", "stalking_q2", "stalking_q3", "stalking_q4", "stalking_2023", "stalking_2023_rate",
              "intimidation_q1", "intimidation_q2", "intimidation_q3", "intimidation_q4", "intimidation_2023", "intimidation_2023_rate",
              "kidnapping_q1", "kidnapping_q2", "kidnapping_q3", "kidnapping_q4", "kidnapping_2023", "kidnapping_2023_rate",
              "drugs_q1", "drugs_q2", "drugs_q3", "drugs_q4", "drugs_2023", "drugs_2023_rate",
              "bribery_q1", "bribery_q2", "bribery_q3", "bribery_q4", "bribery_2023", "bribery_2023_rate",
              "embezzlement_q1", "embezzlement_q2", "embezzlement_q3", "embezzlement_q4", "embezzlement_2023", "embezzlement_2023_rate",
              "fraud_q1", "fraud_q2", "fraud_q3", "fraud_q4", "fraud_2023", "fraud_2023_rate",
              "counterfeit_forgery_q1", "counterfeit_forgery_q2", "counterfeit_forgery_q3", "counterfeit_forgery_q4", "counterfeit_forgery_2023", "counterfeit_forgery_2023_rate",
              "extortion_q1", "extortion_q2", "extortion_q3", "extortion_q4", "extortion_2023", "extortion_2023_rate",
              "prostitution_q1", "prostitution_q2", "prostitution_q3", "prostitution_q4", "prostitution_2023", "prostitution_2023_rate",
              "nonforcible_sex_offenses_q1", "nonforcible_sex_offenses_q2", "nonforcible_sex_offenses_q3", "nonforcible_sex_offenses_q4", "nonforcible_sex_offenses_2023", "nonforcible_sex_offenses_2023_rate",
              "stolen_property_q1", "stolen_property_q2", "stolen_property_q3", "stolen_property_q4", "stolen_property_2023", "stolen_property_2023_rate",
              "vandalism_q1", "vandalism_q2", "vandalism_q3", "vandalism_q4", "vandalism_2023", "vandalism_2023_rate",
              "gambling_q1", "gambling_q2", "gambling_q3", "gambling_q4", "gambling_2023", "gambling_2023_rate",
              "weapons_q1", "weapons_q2", "weapons_q3", "weapons_q4", "weapons_2023", "weapons_2023_rate",
              "identity_q1", "identity_q2", "identity_q3", "identity_q4", "identity_2023", "identity_2023_rate",
              "hacking_q1", "hacking_q2", "hacking_q3", "hacking_q4", "hacking_2023", "hacking_2023_rate",
              "human_trafficking_sex_q1", "human_trafficking_sex_q2", "human_trafficking_sex_q3", "human_trafficking_sex_q4", "human_trafficking_sex_2023", "human_trafficking_sex_2023_rate",
              "human_trafficking_servitude_q1", "human_trafficking_servitude_q2", "human_trafficking_servitude_q3", "human_trafficking_servitude_q4", "human_trafficking_servitude_2023", "human_trafficking_servitude_2023_rate",
              "animal_cruelty_q1", "animal_cruelty_q2", "animal_cruelty_q3", "animal_cruelty_q4", "animal_cruelty_2023", "animal_cruelty_2023_rate"))
# Change columns 3:232 to numeric
fibrs2023[,3:232] <- sapply(fibrs2023[,3:232], as.numeric)

# Import each of the four spreadsheets, skipping first three rows and inserting a row for column names
fibrs2022 <- read_excel("fibrs2022.xlsx", skip = 3, col_names = FALSE) %>% 
  mutate_all(~str_replace(., "--", "0")) %>%
  set_names(c("county", "agency", "population", "quarters_reported", "violent_2022", "violent_2024_rate",
              "property_2022", "property_2022_rate", "other_2022", "other_2022_rate",
              "murder_q1", "murder_q2", "murder_q3", "murder_q4", "murder_2022", "murder_2022_rate",
              "rape_q1", "rape_q2", "rape_q3", "rape_q4", "rape_2022", "rape_2022_rate",
              "robbery_q1", "robbery_q2", "robbery_q3", "robbery_q4", "robbery_2022", "robbery_2022_rate",
              "assault_q1", "assault_q2", "assault_q3", "assault_q4", "assault_2022", "assault_2022_rate",
              "burglary_q1", "burglary_q2", "burglary_q3", "burglary_q4", "burglary_2022", "burglary_2022_rate",
              "larceny_pick_q1", "larceny_pick_q2", "larceny_pick_q3", "larceny_pick_q4", "larceny_pick_2022", "larceny_pick_2022_rate",
              "larceny_purse_q1", "larceny_purse_q2", "larceny_purse_q3", "larceny_purse_q4", "larceny_purse_2022", "larceny_purse_2022_rate",
              "larceny_shoplifting_q1", "larceny_shoplifting_q2", "larceny_shoplifting_q3", "larceny_shoplifting_q4", "larceny_shoplifting_2022", "larceny_shoplifting_2022_rate",
              "larceny_fromvehicle_q1", "larceny_fromvehicle_q2", "larceny_fromvehicle_q3", "larceny_fromvehicle_q4", "larceny_fromvehicle_2022", "larceny_fromvehicle_2022_rate",
              "larceny_vehicleparts_q1", "larceny_vehicleparts_q2", "larceny_vehicleparts_q3", "larceny_vehicleparts_q4", "larceny_vehicleparts_2022", "larceny_vehicleparts_2022_rate",
              "larceny_frombuilding_q1", "larceny_frombuilding_q2", "larceny_frombuilding_q3", "larceny_frombuilding_q4", "larceny_frombuilding_2022", "larceny_frombuilding_2022_rate",
              "larceny_coinmachine_q1", "larceny_coinmachine_q2", "larceny_coinmachine_q3", "larceny_coinmachine_q4", "larceny_coinmachine_2022", "larceny_coinmachine_2022_rate",
              "larceny_other_q1", "larceny_other_q2", "larceny_other_q3", "larceny_other_q4", "larceny_other_2022", "larceny_other_2022_rate",
              "autotheft_q1", "autotheft_q2", "autotheft_q3", "autotheft_q4", "autotheft_2022", "autotheft_2022_rate",
              "negmanslaughter_q1", "negmanslaughter_q2", "negmanslaughter_q3", "negmanslaughter_q4", "negmanslaughter_2022", "negmanslaughter_2022_rate",
              "arson_q1", "arson_q2", "arson_q3", "arson_q4", "arson_2022", "arson_2022_rate",
              "simple_assault_q1", "simple_assault_q2", "simple_assault_q3", "simple_assault_q4", "simple_assault_2022", "simple_assault_2022_rate",
              "stalking_q1", "stalking_q2", "stalking_q3", "stalking_q4", "stalking_2022", "stalking_2022_rate",
              "intimidation_q1", "intimidation_q2", "intimidation_q3", "intimidation_q4", "intimidation_2022", "intimidation_2022_rate",
              "kidnapping_q1", "kidnapping_q2", "kidnapping_q3", "kidnapping_q4", "kidnapping_2022", "kidnapping_2022_rate",
              "drugs_q1", "drugs_q2", "drugs_q3", "drugs_q4", "drugs_2022", "drugs_2022_rate",
              "bribery_q1", "bribery_q2", "bribery_q3", "bribery_q4", "bribery_2022", "bribery_2022_rate",
              "embezzlement_q1", "embezzlement_q2", "embezzlement_q3", "embezzlement_q4", "embezzlement_2022", "embezzlement_2022_rate",
              "fraud_q1", "fraud_q2", "fraud_q3", "fraud_q4", "fraud_2022", "fraud_2022_rate",
              "counterfeit_forgery_q1", "counterfeit_forgery_q2", "counterfeit_forgery_q3", "counterfeit_forgery_q4", "counterfeit_forgery_2022", "counterfeit_forgery_2022_rate",
              "extortion_q1", "extortion_q2", "extortion_q3", "extortion_q4", "extortion_2022", "extortion_2022_rate",
              "prostitution_q1", "prostitution_q2", "prostitution_q3", "prostitution_q4", "prostitution_2022", "prostitution_2022_rate",
              "nonforcible_sex_offenses_q1", "nonforcible_sex_offenses_q2", "nonforcible_sex_offenses_q3", "nonforcible_sex_offenses_q4", "nonforcible_sex_offenses_2022", "nonforcible_sex_offenses_2022_rate",
              "stolen_property_q1", "stolen_property_q2", "stolen_property_q3", "stolen_property_q4", "stolen_property_2022", "stolen_property_2022_rate",
              "vandalism_q1", "vandalism_q2", "vandalism_q3", "vandalism_q4", "vandalism_2022", "vandalism_2022_rate",
              "gambling_q1", "gambling_q2", "gambling_q3", "gambling_q4", "gambling_2022", "gambling_2022_rate",
              "weapons_q1", "weapons_q2", "weapons_q3", "weapons_q4", "weapons_2022", "weapons_2022_rate",
              "identity_q1", "identity_q2", "identity_q3", "identity_q4", "identity_2022", "identity_2022_rate",
              "hacking_q1", "hacking_q2", "hacking_q3", "hacking_q4", "hacking_2022", "hacking_2022_rate",
              "human_trafficking_sex_q1", "human_trafficking_sex_q2", "human_trafficking_sex_q3", "human_trafficking_sex_q4", "human_trafficking_sex_2022", "human_trafficking_sex_2022_rate",
              "human_trafficking_servitude_q1", "human_trafficking_servitude_q2", "human_trafficking_servitude_q3", "human_trafficking_servitude_q4", "human_trafficking_servitude_2022", "human_trafficking_servitude_2022_rate",
              "animal_cruelty_q1", "animal_cruelty_q2", "animal_cruelty_q3", "animal_cruelty_q4", "animal_cruelty_2022", "animal_cruelty_2022_rate"))
# Change columns 3:232 to numeric
fibrs2022[,3:232] <- sapply(fibrs2022[,3:232], as.numeric)

# Import each of the four spreadsheets, skipping first three rows and inserting a row for column names
fibrs2021 <- read_excel("fibrs2021.xlsx", skip = 3, col_names = FALSE) %>% 
  mutate_all(~str_replace(., "--", "0")) %>%
  set_names(c("county", "agency", "population", "violent_2021", "violent_2024_rate",
              "property_2021", "property_2021_rate", "other_2021", "other_2021_rate",
              "murder_q1", "murder_q2", "murder_q3", "murder_q4", "murder_2021", "murder_2021_rate",
              "rape_q1", "rape_q2", "rape_q3", "rape_q4", "rape_2021", "rape_2021_rate",
              "robbery_q1", "robbery_q2", "robbery_q3", "robbery_q4", "robbery_2021", "robbery_2021_rate",
              "assault_q1", "assault_q2", "assault_q3", "assault_q4", "assault_2021", "assault_2021_rate",
              "burglary_q1", "burglary_q2", "burglary_q3", "burglary_q4", "burglary_2021", "burglary_2021_rate",
              "larceny_pick_q1", "larceny_pick_q2", "larceny_pick_q3", "larceny_pick_q4", "larceny_pick_2021", "larceny_pick_2021_rate",
              "larceny_purse_q1", "larceny_purse_q2", "larceny_purse_q3", "larceny_purse_q4", "larceny_purse_2021", "larceny_purse_2021_rate",
              "larceny_shoplifting_q1", "larceny_shoplifting_q2", "larceny_shoplifting_q3", "larceny_shoplifting_q4", "larceny_shoplifting_2021", "larceny_shoplifting_2021_rate",
              "larceny_fromvehicle_q1", "larceny_fromvehicle_q2", "larceny_fromvehicle_q3", "larceny_fromvehicle_q4", "larceny_fromvehicle_2021", "larceny_fromvehicle_2021_rate",
              "larceny_vehicleparts_q1", "larceny_vehicleparts_q2", "larceny_vehicleparts_q3", "larceny_vehicleparts_q4", "larceny_vehicleparts_2021", "larceny_vehicleparts_2021_rate",
              "larceny_frombuilding_q1", "larceny_frombuilding_q2", "larceny_frombuilding_q3", "larceny_frombuilding_q4", "larceny_frombuilding_2021", "larceny_frombuilding_2021_rate",
              "larceny_coinmachine_q1", "larceny_coinmachine_q2", "larceny_coinmachine_q3", "larceny_coinmachine_q4", "larceny_coinmachine_2021", "larceny_coinmachine_2021_rate",
              "larceny_other_q1", "larceny_other_q2", "larceny_other_q3", "larceny_other_q4", "larceny_other_2021", "larceny_other_2021_rate",
              "autotheft_q1", "autotheft_q2", "autotheft_q3", "autotheft_q4", "autotheft_2021", "autotheft_2021_rate",
              "negmanslaughter_q1", "negmanslaughter_q2", "negmanslaughter_q3", "negmanslaughter_q4", "negmanslaughter_2021", "negmanslaughter_2021_rate",
              "arson_q1", "arson_q2", "arson_q3", "arson_q4", "arson_2021", "arson_2021_rate",
              "simple_assault_q1", "simple_assault_q2", "simple_assault_q3", "simple_assault_q4", "simple_assault_2021", "simple_assault_2021_rate",
              "stalking_q1", "stalking_q2", "stalking_q3", "stalking_q4", "stalking_2021", "stalking_2021_rate",
              "intimidation_q1", "intimidation_q2", "intimidation_q3", "intimidation_q4", "intimidation_2021", "intimidation_2021_rate",
              "kidnapping_q1", "kidnapping_q2", "kidnapping_q3", "kidnapping_q4", "kidnapping_2021", "kidnapping_2021_rate",
              "drugs_q1", "drugs_q2", "drugs_q3", "drugs_q4", "drugs_2021", "drugs_2021_rate",
              "bribery_q1", "bribery_q2", "bribery_q3", "bribery_q4", "bribery_2021", "bribery_2021_rate",
              "embezzlement_q1", "embezzlement_q2", "embezzlement_q3", "embezzlement_q4", "embezzlement_2021", "embezzlement_2021_rate",
              "fraud_q1", "fraud_q2", "fraud_q3", "fraud_q4", "fraud_2021", "fraud_2021_rate",
              "counterfeit_forgery_q1", "counterfeit_forgery_q2", "counterfeit_forgery_q3", "counterfeit_forgery_q4", "counterfeit_forgery_2021", "counterfeit_forgery_2021_rate",
              "extortion_q1", "extortion_q2", "extortion_q3", "extortion_q4", "extortion_2021", "extortion_2021_rate",
              "prostitution_q1", "prostitution_q2", "prostitution_q3", "prostitution_q4", "prostitution_2021", "prostitution_2021_rate",
              "nonforcible_sex_offenses_q1", "nonforcible_sex_offenses_q2", "nonforcible_sex_offenses_q3", "nonforcible_sex_offenses_q4", "nonforcible_sex_offenses_2021", "nonforcible_sex_offenses_2021_rate",
              "stolen_property_q1", "stolen_property_q2", "stolen_property_q3", "stolen_property_q4", "stolen_property_2021", "stolen_property_2021_rate",
              "vandalism_q1", "vandalism_q2", "vandalism_q3", "vandalism_q4", "vandalism_2021", "vandalism_2021_rate",
              "gambling_q1", "gambling_q2", "gambling_q3", "gambling_q4", "gambling_2021", "gambling_2021_rate",
              "weapons_q1", "weapons_q2", "weapons_q3", "weapons_q4", "weapons_2021", "weapons_2021_rate",
              "identity_q1", "identity_q2", "identity_q3", "identity_q4", "identity_2021", "identity_2021_rate",
              "hacking_q1", "hacking_q2", "hacking_q3", "hacking_q4", "hacking_2021", "hacking_2021_rate",
              "human_trafficking_sex_q1", "human_trafficking_sex_q2", "human_trafficking_sex_q3", "human_trafficking_sex_q4", "human_trafficking_sex_2021", "human_trafficking_sex_2021_rate",
              "human_trafficking_servitude_q1", "human_trafficking_servitude_q2", "human_trafficking_servitude_q3", "human_trafficking_servitude_q4", "human_trafficking_servitude_2021", "human_trafficking_servitude_2021_rate",
              "animal_cruelty_q1", "animal_cruelty_q2", "animal_cruelty_q3", "animal_cruelty_q4", "animal_cruelty_2021", "animal_cruelty_2021_rate"))
# Change columns 3:232 to numeric
fibrs2021[,3:232] <- sapply(fibrs2021[,3:232], as.numeric)
