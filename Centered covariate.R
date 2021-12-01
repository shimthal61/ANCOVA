# We can scale and centre our covariant.
# This standadises the variable and removes the need to multiply the linear model coeffiient for the covariate by the covariate’s mean.

my_scaled_data <- my_data %>% 
  mutate(centred_gaming = scale(Gaming))

# We can see how the distribution has changed

plot(density(my_scaled_data$Gaming))

plot(density(my_scaled_data$centred_gaming))

# Finally, let's build our linear model with the scaled and centered covariate

model_ancova_centred <- lm(Ability ~ centred_gaming + Condition, data = my_scaled_data)

model_ancova_centred

#We see that the Intercept now corresponds to the adjusted mean for the Water group