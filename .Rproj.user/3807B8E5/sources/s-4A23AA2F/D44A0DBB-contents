# Let us model our linear model

model_lm <- lm(Ability ~ Condition, data = my_data)

model_lm

# The intercept is our water variable
# To work out the mean Ability of our Double Espresso group, we use the coding for the Double Espresso contrast (1, 0)

# Double Espresso mean Ability:

Dbl_Esp_mean <- 4.817 + 4.199*1 + 1.871*0

Sng_Esp_mean <- 4.817 + 4.199*0 + 1.871*1

# To build our ANCOVA model we simply add our covaritate 

model_ancova <- lm(Ability ~ Gaming + Condition, data = my_data)

model_ancova

#Work out the mean of the water group by plugging in the values to our equation

mean(my_data$Gaming)

#We add this mean (12.62296) to our equation alongside the co-efficients for each of our predictors. 

#water_mean <- Intercept + β1(Gaming) + β2(Double Espresso) + β3(Single Espresso)
water_mean <- -3.4498 + 0.8538*12.62296 + (- 1.0085*0) + (-0.4563*0)
