library(ISLR)
library(olsrr)
bodyfat <- read.csv(file = "bodyfat.csv")

bodyfat$Age_group <- cut(bodyfat$Age,
                         breaks = c(22,40,60,82),
                         labels = c("Younger", "Middle-Aged", "Older"),
                         right = FALSE)
model <- lm(BodyFat ~ Age_group + Height + Weight 
            + Density + Neck + Abdomen + Chest + Hip
            + Knee + Thigh + Ankle + Biceps +
              Forearm + Wrist, data = bodyfat)

ols_step_backward_p(model)
ols_step_forward_p(model)
ols_step_both_p(model)
