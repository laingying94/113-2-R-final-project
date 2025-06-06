# 載入必要套件
library(tidyverse)
library(vcd)

# 建立乾淨副本
lung_df <- lung_data

# 重新命名欄位，處理所有含空格的變數名稱
lung_df <- lung_df |>
  rename(
    Smoking = `Smoking Status`,
    Disease = `Disease Type`
  )

# 處理資料：篩選非缺值並新增是否為肺癌欄位
lung_df <- lung_df |>
  filter(!is.na(Gender), !is.na(Smoking), !is.na(Disease)) |>
  mutate(
    LungCancer = if_else(Disease == "Lung Cancer", "Yes", "No")
  )

# 建立列聯表
mosaic_table <- xtabs(~ Gender + Smoking + LungCancer, data = lung_df)

# 繪製馬賽克圖
mosaic(
  mosaic_table,
  shade = TRUE,
  legend = TRUE,
  labeling_args = list(set_varnames = c(
    Gender = "Gender",
    Smoking = "Smoking",
    LungCancer = "Lung Cancer"
  )),
  main = "Mosaic Plot: Gender × Smoking × Lung Cancer"
)
# 使用剛才處理過的 lung_df 資料
table_smoking_lung <- table(lung_df$Smoking, lung_df$LungCancer)
table_smoking_lung
chisq.test(table_smoking_lung)
chisq.test(table(lung_df$Gender, lung_df$LungCancer))


