lung_subset_age <- lung_data %>%
  filter(`Disease Type` == "Lung Cancer") %>%
  filter(!is.na(`Smoking Status`), !is.na(Age))
ggplot(lung_subset_age, aes(x = `Smoking Status`, y = Age, fill = `Smoking Status`)) +
  geom_boxplot() +
  labs(title = "Age Distribution by Smoking Status (Lung Cancer Patients)",
       x = "Smoking Status",
       y = "Age") +
  theme_minimal()
lung_subset_age %>%
  group_by(`Smoking Status`) %>%
  summarise(mean_age = mean(Age),
            median_age = median(Age),
            sd_age = sd(Age),
            n = n())
t.test(Age ~ `Smoking Status`, data = lung_subset_age)
