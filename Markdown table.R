library(tidyverse)

lung_disease_data <- read_csv(
  "lung_disease_data.csv",
  col_types = cols(
    Age = col_double(),
    Gender = col_factor(levels = c("Male", "Female")),
    `Smoking Status` = col_factor(levels = c("No", "Yes")),
    `Lung Capacity` = col_double(),
    `Disease Type` = col_factor(
      levels = c("Bronchitis", "Asthma", "COPD", "Pneumonia", "Lung Cancer")
    ),
    `Treatment Type` = col_factor(
      levels = c("Medication", "Therapy", "Surgery")
    ),
    `Hospital Visits` = col_double(),
    Recovered = col_factor(levels = c("No", "Yes"))
  )
)

