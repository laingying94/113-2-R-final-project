library(tidyverse)
library(jsonlite)

# 描述文字（依照你提供的 codebook）
variable_descriptions <- list(
  "Age" = "Age of the patient in years.",
  "Gender" = "Biological sex of the patient. Common values: 'Male', 'Female'.",
  "Smoking Status" = "Indicates whether the patient has a history of smoking. Values: 'Yes', 'No', or NA.",
  "Lung Capacity" = "Measured lung function to assess disease severity.",
  "Disease Type" = "The specific lung condition, like COPD, Bronchitis, or Lung Cancer.",
  "Treatment Type" = "Type of treatment received: therapy, medication, or surgery.",
  "Hospital Visits" = "Number of hospital visits for managing the condition.",
  "Recovery Status" = "Indicates whether the patient recovered after treatment. Values: 'Yes', 'No'."
)

# 安全抓取描述，如果沒有對應，回傳預設文字
get_description <- function(var_name) {
  variable_descriptions[[var_name]] %||% "No description provided."
}

# 摘要每個變數的函數
summarise_variable <- function(var, var_name) {
  if (is.numeric(var)) {
    list(
      description = get_description(var_name),
      summary = summary(var) %>% as.list() %>%
        append(list(missing = sum(is.na(var))))
    )
  } else if (is.character(var) || is.factor(var)) {
    list(
      description = get_description(var_name),
      summary = table(var, useNA = "ifany") %>% as.list()
    )
  } else {
    list(
      description = get_description(var_name),
      summary = "Unsupported variable type."
    )
  }
}

# 假設 lung_disease_data 已存在
summary_list <- map(names(lung_disease_data), function(var_name) {
  summarise_variable(lung_disease_data[[var_name]], var_name)
}) %>% set_names(names(lung_disease_data))

# 建立最終 JSON 結構
final_json <- list(
  description = "Summary statistics for each variable in lung_disease_data according to its class.",
  summary = summary_list
)

# 寫入 JSON 檔案，並設定 UTF-8 編碼避免中文字亂碼
write_json(final_json, path = "lung_disease_summary.json", pretty = TRUE, auto_unbox = TRUE, encoding = "UTF-8")

