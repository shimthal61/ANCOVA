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