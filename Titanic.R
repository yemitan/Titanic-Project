# import library
library(ggplot2)

# load titanic data for analysis
titanic <- read.csv("titanic", stringsAsFactors = FALSE)
View(titanic) 
titanic = read.csv('titanic')
titanic = read.csv('titanic.csv')
View(titanic)

# setup factors
titanic$Pclass = as.factor(titanic$Pclass)
titanic$Survived = as.factor(titanic$Survived)
titanic$Sex = as.factor(titanic$Sex)
titanic$Embarked = as.factor(titanic$Embarked)

# visualize in Barchart
ggplot(titanic, aes(x = Survived)) +
  geom_bar()
# to estimate the percentage
prop.table(table(titanic$Survived)) 
# add some customization for labels and theme
ggplot(titanic, aes(x = Survived)) +
  theme_bw() + 
  geom_bar() +
  labs(y = "Passenger Count", 
       title = "Titanic Survived Rates") 

# Second Question - what was the survival rate by Gender
ggplot(titanic, aes(x = Sex, fill = Survived)) +
  theme_bw() +
  geom_bar() + 
  labs(y = "Passenger Count", 
       title = "Survival rates by Sex")

# what was the Survival rate
ggplot(titanic, aes(x = Pclass, fill = Survived)) +
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count", 
       title = "Survival rate by Pclass")

# Fourth Question - what was the Survival rate by class of ticket and by gender?
ggplot(titanic, aes(x = Sex, fill = Survived)) +
  theme_bw() +
  facet_wrap(~ Pclass) +
  geom_bar() +
  labs(y = "Passenger Count", 
       title = "Survival rate by Sex and Pclass") 

# Fifth Question - whats the distribution of the ages 
ggplot(titanic, aes(x = Age)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age(binwidth = 5)",
       title = "Titanic Age DIstribution")

# what are the Survival Rates by Ages
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age(binwidth = 5)",
       title = "Titanic Age DIstribution")

# Another great visualisation is the Box and whisker
ggplot(titanic, aes(x = Survived, y = Age)) +
  theme_bw() +
  geom_boxplot()
labs(y = "Age",
     x = "Survived",
     title = "Titanic Survival rate by Age")

# Seventh Question - what is the survival rates by Age when segmented
# by Gender and Class of Ticket?
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(Sex ~ Pclass) +
  geom_density(alpha = 0.5) +
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival rates by Age, Sex and Pclass")

# If you prefer Histogram
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(Sex ~ Pclass) +
  geom_histogram(binwidth = 5) +
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival rates by Age, Sex and Pclass")
# Thank You