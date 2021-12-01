head(my_data)

# Creating a plot examining coffee effect on motor ability
my_data %>% 
  ggplot(aes(x = Condition, y = Ability, colour = Condition)) +
  geom_violin() +
  geom_jitter(width = 0.05, alpha = .8) +
  theme_minimal() +
  labs(x = "Condition",
       y = "Motor Ability") +
  guides(colour = 'none') +
  stat_summary(fun.data = mean_cl_boot, colour = "black") +
  theme(text = element_text(siz = 13))

# Looking at how the Condition factor has been coded in terms of its contrasts

contrasts(my_data$Condition)

# We want water, not double espresso as our baseline and intercept (0,0), so let's fix that

my_data <- my_data %>% 
  mutate(Condition = fct_relevel(Condition,
                                 levels = c("Water", "Double Espresso", "Single Espresso")))

# Let's check our contrasts again
contrasts(my_data$Condition)
