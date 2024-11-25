library(car)  
library(tidyverse)  

data <- data.frame(
  Source = c("p", "n", "q", "pos", "gamma", "PLSMethod", "p:pos", "p:gamma", "n:q", 
             "n:pos", "n:gamma", "q:gamma", "p:PLSMethod", "gamma:PLSMethod", 
             "p:gamma:PLSMethod", "Residuals"),
  Sum_Sq = c(0.002, 86.987, 2.934, 3.224, 144.743, 18.785, 0.588, 0.652, 0.691, 
             1.193, 46.926, 5.851, 4.835, 8.136, 4.419, 280.809),
  Df = c(1, 1, 1, 1, 1, 14, 1, 1, 1, 1, 1, 1, 14, 14, 14, 4732),
  F_value = c(0.0302, 1465.8391, 49.4375, 54.3282, 2439.1073, 22.6107, 9.9117, 
              10.9786, 11.6409, 20.0977, 790.7716, 98.6028, 5.8199, 9.7926, 5.3195, NA),
  Pr_greater_F = c(0.862011, "< 2.2e-16", "2.340e-12", "1.992e-13", "< 2.2e-16", 
                   "< 2.2e-16", "0.0016525", "0.0009286", "0.0006506", "7.532e-06", 
                   "< 2.2e-16", "< 2.2e-16", "1.937e-11", "< 2.2e-16", "3.629e-10", NA)
)

print(data)

ggplot(data %>% filter(Source != "Residuals"), aes(x = reorder(Source, Sum_Sq), y = Sum_Sq)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  labs(title = "Sum of Squares by Source", x = "Source", y = "Sum of Squares") +
  theme_minimal()

var_selection <- data.frame(
  Method = c("LW", "RC", "JT", "VIP", "SR", "sMC", "mRMR", "GA", 
             "MCUVE", "SPA", "IPW", "BVE", "REP", "T2", "ST", "TRUNC", "WVC"),
  Score = c(0.05, 0.17, 0.15, 0.9, 0.32, 25.2, 0.75, 8.39, 2.01, 0.33, 0.01, 
            1.12, 1.15, 0.1, 0.54, 0.9, 0.17)
)

ggplot(var_selection, aes(x = reorder(Method, Score), y = Score)) +
  geom_bar(stat = "identity", fill = "forestgreen") +
  coord_flip() +
  labs(title = "Variable Selection Scores", x = "Method", y = "Score") +
  theme_minimal()

set.seed(123)
sample_data <- data.frame(
  n = rnorm(100, mean = 5, sd = 2),
  gamma = rnorm(100, mean = 10, sd = 3),
  q = rnorm(100, mean = 8, sd = 2),
  pos = rnorm(100, mean = 4, sd = 1),
  response = rnorm(100, mean = 20, sd = 5)
)

model <- lm(response ~ n * gamma * q * pos, data = sample_data)

anova_results <- Anova(model, type = "III")
print(anova_results)

summary(model)

