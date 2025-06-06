lung_data <- read_csv("lung_disease_data.csv")
lung_subset <- lung_data %>%
  filter(`Disease Type` == "Lung Cancer") %>%       # 只看肺癌病人
  filter(!is.na(`Smoking Status`))         # 移除吸菸狀態缺失值
ggplot(lung_subset, aes(x = `Smoking Status`)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Lung Cancer Patients by Smoking Status",
       x = "Smoking Status",
       y = "Count") +
  theme_minimal()
lung_subset %>%
  count(`Smoking Status`) %>%
  mutate(Percent = n / sum(n)) %>%
  ggplot(aes(x = `Smoking Status`, y = Percent)) +
  geom_col(fill = "darkorange") +
  scale_y_continuous(labels = scales::percent) +
  labs(title = "Percentage of Smoking among Lung Cancer Patients",
       y = "Percentage",
       x = "Smoking Status") +
  theme_minimal()
# 先建立吸菸 vs 疾病類型交叉表（整體分析）
lung_clean <- lung_data %>%
  filter(!is.na(`Smoking Status`), !is.na(`Disease Type`))

table_smoking_disease <- table(lung_clean$`Smoking Status`, lung_clean$`Disease Type`)
chisq.test(table_smoking_disease)

