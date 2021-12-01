my_data <- read_csv("https://raw.githubusercontent.com/ajstewartlang/12_glm_anova_pt2/master/data/ancova_data.csv")

head(my_data)

# Recoding our Condition factor into a factor
my_data <- my_data %>% 
  mutate(Condition = factor(Condition))

head(my_data)

#Generating summary stats
my_data %>% 
  group_by(Condition) %>% 
  summarise(mean = mean(Ability), sd = sd(Ability))

#Creating a visualisation
my_data %>% 
  ggplot(aes(x = Gaming, y = Ability, colour = Condition)) +
  geom_point(size = 3, alpha = .9) +
  labs(x = "Gaming Frequency (hours per week)", 
       y = "Motor Ability") +
  theme_minimal() +
  theme(text = element_text(size = 11))

#Building our first ANOVA model
anova_model <- aov_4(Ability ~ Condition + (1 | Participant), data = my_data)

anova_model

# Looking at our output, it appears that we have a significant F statistic and p value for this model

#We should run pairwise comparisons

emmeans(anova_model, pairwise ~ Condition)

# From these results, it appears as if all 3 of these levels differ significantly from each other. 

# However, we need to take into account our covariate - gaming.

model_ancova <- aov_4(Ability ~ Gaming + Condition + (1 | Participant), 
                      data = my_data,
                      factorize = FALSE) #We want our gaming factor to be treated as a continuous variable

anova(model_ancova)

#We can see from this that Condition (i.e. coffee) no longer has a significant effect on Motor Ability

# We can now find the adjusted means (i.e. the means for our three groups taking into account the covariance)

emmeans(model_ancova, pairwise ~ Condition, adjust = "Bonferroni")

#Now it is easy to see that none of the levels differ significantly from eachother.


