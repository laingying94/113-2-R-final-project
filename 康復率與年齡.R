library(tidyverse)

# 前處理：建立年齡區間與康復二元變數
lung_age_recovery <- lung_data %>%
  filter(!is.na(Age), !is.na(Recovered)) %>%
  mutate(
    Recovered_binary = if_else(Recovered == "Yes", 1, 0),
    AgeGroup = cut(
      Age,
      breaks = seq(10, 90, by = 10),
      right = FALSE,
      labels = paste(seq(10, 80, by = 10), seq(19, 89, by = 10), sep = "-")
    )
  )

# 計算每個年齡區間的康復率與樣本數
age_group_summary <- lung_age_recovery %>%
  group_by(AgeGroup) %>%
  summarise(
    RecoveryRate = mean(Recovered_binary),
    Count = n()
  )

# 畫出圖表：折線 + 點 + 標籤 + 趨勢線
ggplot(age_group_summary, aes(x = AgeGroup, y = RecoveryRate, group = 1)) +
  geom_line(color = "steelblue", size = 1.2) +
  geom_point(size = 2, color = "darkblue") +
  geom_text(aes(label = paste0("n=", Count)), vjust = -1, size = 3.5) +
  geom_smooth(method = "loess", se = FALSE, color = "firebrick", linetype = "dashed") +
  scale_y_continuous(labels = scales::percent, limits = c(0, 1)) +
  labs(
    title = "Recovery Rate by 10-Year Age Group",
    subtitle = "With sample size and loess-smoothed trend",
    x = "Age Group",
    y = "Recovery Rate"
  ) +
  theme_minimal()

