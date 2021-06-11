#loading neccessary packages 
library(dplyr)
library(readr)
library(ggplot2)
library(viridis)
library(RColorBrewer)
library(ggthemes)
library(ggrepel)

#loading dataset 
library(readr)
gssProject1 <- read_csv("C:/Users/darie/Downloads/gssProject1.csv")
View(gssProject1)

#Getting the final sample size 
glimpse(gssProject1)

#Race
#horizontal bar graph to show distribution of race within survey
ggplot(gssProject1, aes(race, fill = race)) +
  geom_bar() +
  scale_fill_manual(values = c("#FE6E02", "#FFCC77", "#152852")) +
  labs(x = "Race",
       y = "Count",
       title = "Distribution of Race in Survey",
       fill = "Race") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

#Getting the count of race responses in survey
table(gssProject1$race) 

# Sex
#Creating a horizontal bar graph to show distribution of sex within survey
ggplot(gssProject1, aes(sex, fill = sex)) +
  geom_bar() +
  scale_fill_manual(values = c("#688052", "#Fa9584")) +
  labs(x = "Sex",
       y = "Count",
       title = "Distribution of Sex in Survey",
       fill = "Sex") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

#Getting the count of sex responses in survey
table(gssProject1$sex)

# Age
#Creating a horizontal bar graph to show distribution of age within survey
ggplot(gssProject1, aes(age)) +
  geom_histogram(binwidth = 1, fill = "lightblue", color = "black") +
  labs(x = "Age",
       y = "Count",
       title = "Distribution of Age in Survey") +
  theme_classic(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5))

### Marital Status
#Creating a horizontal bar graph to show distribution of martial status within survey
ggplot(gssProject1, aes(maritalStatus, fill = maritalStatus)) +
  geom_bar() +
  labs(x = "Marital Status",
       y = "Count",
       title = "Distribution of Marital Status in Survey",
       fill = "Martial Status") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

#Getting the count of martial status responses in survey
table(gssProject1$maritalStatus)


# Question 2:  Does the sample include a fair representation of race within each region of the country?
#Creating a stacked bar graph for variables region and race 
ggplot(gssProject1, aes(region, fill = race)) +
  geom_bar() +
  labs(x = "Region",
       y = "Count",
       title = "Representation of Race Within Each Region of the Country",
       fill = "Race") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12)) +
  scale_fill_viridis(discrete = T)

#Creating a table to get counts for the graph 
q2_table <- gssProject1 %>%
  select(region, race)

#Display table 
table(q2_table)

# Question 3: Is the number of hours usually worked in a week related to any of the following: trouble sleeping, job stress, job satisfaction, health, and happiness?
# Hours Usually Worked and Trouble Sleeping
#Creating new datatset to show the relation between hrsUsuallyWork and troubleSleeping
question3_sleeping <- gssProject1 %>%
  select(hrsUsuallyWork, troubleSleeping) %>%
  filter(!is.na(hrsUsuallyWork)) %>%
  group_by(troubleSleeping) %>%
  summarize(n = n(),
            mean_hrs = mean(hrsUsuallyWork),
            sd = sd(hrsUsuallyWork),
            se = sd/sqrt(n),
            ci = qt(0.975, df = n - 1) * sd / sqrt(n))

#Verifying new dataset and getting insight
question3_sleeping

#plotting vertical graph for hrsUsuallywork and troubleSleeping with error bars
ggplot(question3_sleeping, aes(troubleSleeping, mean_hrs, fill = troubleSleeping)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = mean_hrs - se,
                    ymax = mean_hrs + se),
                width = .1, size = 1) +
  labs(x = "Trouble Sleeping?",
       y = "Average Hours of Work",
       title = "Relation Between Number of Hours of Work and Difficulty of Sleeping",
       fill = "Trouble Sleeping?") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

# Hours Usually Worked and Job Stress
#Creating new dataset to show the relation between hrsUsuallyWork and jobstress
question3_stress <- gssProject1 %>%
  select(hrsUsuallyWork, jobStressful) %>%
  filter(!is.na(hrsUsuallyWork)) %>%
  group_by(jobStressful) %>%
  summarize(n = n(),
            mean_hrs = mean(hrsUsuallyWork),
            sd = sd(hrsUsuallyWork),
            se = sd/sqrt(n),
            ci = qt(0.975, df = n - 1) * sd / sqrt(n))

#verifying new dataset and getting insight
question3_stress

#plotting vertical bargraph with error bars
ggplot(question3_stress, aes(jobStressful, mean_hrs, fill = jobStressful)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = mean_hrs - se,
                    ymax = mean_hrs + se),
                width = .1, size = 1) +
  labs(x = "Is Your Job Stressful?",
       y = "Average Hours of Work",
       title = "Relation Between Number of Hours of Work and Stress Level",
       fill = "Stress Level") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

# Hours Usually Worked and Job Satisfaction
#Creating new dataset to show the relation between hrsUsuallyWork and jobsatisfaction
question3_jobsatis <- gssProject1 %>%
  select(hrsUsuallyWork, jobSatisfaction) %>%
  filter(!is.na(hrsUsuallyWork)) %>%
  group_by(jobSatisfaction) %>%
  summarize(n = n(),
            mean_hrs = mean(hrsUsuallyWork),
            sd = sd(hrsUsuallyWork),
            se = sd/sqrt(n),
            ci = qt(0.975, df = n - 1) * sd / sqrt(n))

#verifying new dataset and getting insight
question3_jobsatis

#plotting vertical bar graph with error bars
ggplot(question3_jobsatis, aes(jobSatisfaction, mean_hrs, fill = jobSatisfaction)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = mean_hrs - se,
                    ymax = mean_hrs + se),
                width = .1, size = 1) +
  labs(x = "Job Satisfaction",
       y = "Count",
       title = "Relation Between Number of Hours of Work and Job Satisifaction",
       fill = "Job Satisifaction") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

# Hours Usually Worked and Health
#Creating a new dataset to show the relation between hrsUsuallyWork and health
question3_health <- gssProject1 %>%
  select(hrsUsuallyWork, health) %>%
  filter(!is.na(health)) %>%
  filter(!is.na(hrsUsuallyWork))

#summarizing new dataset for boxplot
summary(question3_health)

#plotting boxplot 
ggplot(question3_health, aes(health, hrsUsuallyWork, fill = health)) +
  geom_boxplot() +
  annotate(geom = "text",
           x = 1,
           y = 84,
           label = "High number of hours worked",
           hjust = 0,
           size = 3) +
  annotate(geom = "text",
           x = 1,
           y = 9,
           label = "Low number of hours worked",
           hjust = 0,
           size = 3) +
  labs(x = "Health",
       y = "Usual Hours Worked",
       title = "Relation Between Number of Hours of Work and Health",
       fill = "Health") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

# Hours Usually Worked and Happiness
#Creating a new dataset to show the relation between hrsUsuallyWork and Happiness 
question3_happy <- gssProject1 %>%
  select(hrsUsuallyWork, happiness) %>%
  filter(!is.na(hrsUsuallyWork))

#summarizing new datatset for boxplot
summary(question3_happy)

#plotting boxplot 
ggplot(question3_happy, aes(happiness, hrsUsuallyWork, fill = happiness)) +
  geom_boxplot() + 
  annotate(geom = "text",
           x = 2.05,
           y = 84,
           label = "High number of hours worked",
           hjust = 0,
           size = 3) + 
  annotate(geom = "text",
           x = 1.3,
           y = 5,
           label = "Low number of hours worked",
           hjust = 0,
           size = 3) +
  labs(x = "Happiness Level",
       y = "Usual Hours Worked",
       title = "Relation Between Number of Hours of Work and Happiness",
       fill = "Happiness") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

# Question 4: What is the relationship between the number of hours spouses usually work each week? That is, as one spouse works more, does that mean the other spouse works less? Or, vice versa?
#Creating a new dataset to show the relation between the numbers of hours spouses usually work each week

question4 <- gssProject1 %>%
  select(hrsUsuallyWork, hrsSpouseUsuallyWork) %>%
  filter(!is.na(hrsUsuallyWork & hrsSpouseUsuallyWork))

question4
#Getting the count for new dataset 
table(question4)

#Plotting scatterplot without geom_jitter for overplotted points
ggplot(question4, aes(hrsUsuallyWork, hrsSpouseUsuallyWork)) +
  geom_point() +
  annotate(geom = "text",
           x = 25.3,
           y = 61.5,
           label = "High number of hours worked",
           hjust = 0,
           size = 3) +
  labs(x = "Usual Hours Worked Per Week",
       y = "Usual Hours Spouse Worked Per Week",
       title = "Relation Between Number of Hours of Work and Number of Hours the Spouse Worked") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

#Plotting scatterplot with geom_jitter for overplotted points
ggplot(question4, aes(hrsUsuallyWork, hrsSpouseUsuallyWork)) +
  geom_point() +
  geom_jitter() +
  annotate(geom = "text",
           x = 25.3,
           y = 61.5,
           label = "High number of hours worked",
           hjust = 0,
           size = 3) +
  labs(x = "Usual Hours Worked Per Week",
       y = "Usual Hours Spouse Worked Per Week",
       title = "Relation Between Number of Hours of Work and Number of Hours the Spouse Worked") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

# Question 5: Does the amount of time that people spend on email each week vary as a function of the highest degree that they’ve earned? That is, do people with more education, have jobs where they spend more time on email?
#Creating new dataset to see if people with more education have jobs where they spend more time on email
question5 <- gssProject1 %>%
  select(hrsEmailPerWeek, highestDegree) %>%
  filter(!is.na(hrsEmailPerWeek)) %>%
  group_by(highestDegree) %>%
  summarize(n = n(),
            mean_email = mean(hrsEmailPerWeek),
            sd = sd(hrsEmailPerWeek),
            se = sd/sqrt(n),
            ci = qt(0.975, df = n - 1) * sd / sqrt(n))

#verifying new dataset and getting insight
question5

#Plotting vertical bar graph with errorbars 
ggplot(question5, aes(highestDegree, mean_email, fill = highestDegree)) +
  geom_bar(stat = "identity") +
  geom_errorbar(aes(ymin = mean_email - se,
                    ymax = mean_email + se),
                width = .1, 
                size = 1) +
  labs(x = "Highest Degree Earned",
       y = "Average Time On Emails",
       title = "Relation Between Average of Hours on Emails and Highest Degree Earned",
       fill = "Highest Degree") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

# Question6: Do people who live alone work more than people who live with others in their household?
#Creating a new dataset to figure out if people who live alone work more than people who live with others in their household
question6 <- gssProject1 %>%
  select(hrsUsuallyWork, householdSize) %>%
  filter(!is.na(hrsUsuallyWork)) %>%
  group_by(householdSize) %>%
  summarize(n = n(),
            mean_hrs = mean(hrsUsuallyWork),
            sd = sd(hrsUsuallyWork),
            se = sd/sqrt(n),
            ci = qt(0.975, df = n - 1) * sd / sqrt(n))
 
#verifying new dataset and getting insight
question6

#Plotting scatterplot with geom_jitter for overplotted points
ggplot(question6, aes(householdSize, mean_hrs)) +
  geom_point() +
  geom_jitter() +
  annotate(geom = "text",
           x = 7,
           y = 51,
           label = "High number of household members",
           hjust = 0,
           size = 3) +
  labs(x = "Household Size",
       y = "Average Hours Worked",
       title = "Relation Between Average of Hours of Work and Household Size") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5))

# Question 7: Is fear of walking in one’s own neighborhood at night related to any of the following: current family income, age, sex, race, or region?
#For this question, I am filtering out all of the unneccessary categorical levels except 'Yes' and 'No' for the afraidWalkNightNeighborhood variable
question7 <-  gssProject1 %>%
  filter(afraidWalkNightNeighborhood == "Yes" | afraidWalkNightNeighborhood == "No")

#Verifying filters in new dataset 
question7


# Afraid of Walking at Night Alone and Current Family Income
#Creating new dataset to figure out if there exists a relation between a fear of walking in neighborhood at night and family income
question7_income <- question7 %>%
  select(afraidWalkNightNeighborhood, currentFamIncome) %>%
  filter(!is.na(afraidWalkNightNeighborhood)) %>%
  arrange(currentFamIncome)

#Verifying new dataset 
question7_income

#Creating a vertical bar chart 
ggplot(question7_income, aes(currentFamIncome, fill = afraidWalkNightNeighborhood)) +
  geom_bar(position = "dodge") +
  labs(x = "Current Family Income",
       y = "Count",
       title = "Relation Between Fear of Walking In Neighborhood at Night and Current Family Income",
       fill = "Fear of Walking at Night") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12)) 

# Afraid of Walking at Night Alone and Age
#Creating new dataset to figure out of there is a relation between a fear of walking in neighborhood at night and age
question7_age <- question7 %>%
  select(afraidWalkNightNeighborhood, age) %>%
  filter(!is.na(afraidWalkNightNeighborhood)) %>%
  arrange(age)

#Verifying new dataset 
question7_age

#Plotting a boxplot
ggplot(question7_age, aes(afraidWalkNightNeighborhood, age, fill = afraidWalkNightNeighborhood )) +
  geom_boxplot() +
  labs(x = "Afraid of Walking at Night",
       y = "Age",
       title = "Fear of Walking In Neighborhood at Night and Age",
       fill = "Fear of Walking at Night") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

#Summarizing new dataset for boxplot 
summary(question7_age)

# Afraid of Walking at Night Alone and Sex
#Creating a new dataset to figure out of there is a relation between a fear of walking in neighborhood at night and sex
question7_sex <- question7 %>%
  select(afraidWalkNightNeighborhood, sex) %>%
  filter(!is.na(afraidWalkNightNeighborhood))

#Verifying new dataset 
question7_sex

#Creating a vertical bar chart
ggplot(question7_sex, aes(afraidWalkNightNeighborhood, fill = sex)) +
  geom_bar(position = "dodge") +
  labs(x = "Fear of Walking at Night?",
       y = "Count",
       title = "Relation Between Fear of Walking In Neighborhood at Night and Sex",
       fill = "Sex") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

#Using a table to get a count for this dataset 
table(question7_sex)

# Afraid of Walking at Night Alone and Region
#Creating a dataset to figure out if there is a relation between a fear of walking in neighborhood at night and region
question7_region <- question7 %>%
  select(afraidWalkNightNeighborhood, region) %>%
  filter(!is.na(afraidWalkNightNeighborhood))

#Verifying new dataset
question7_region

#Creating stacked bar chart 
ggplot(question7_region, aes(region, fill = afraidWalkNightNeighborhood)) +
  geom_bar(position = "dodge") +
  labs(x = "Region",
       y = "Count",
       title = "Fear of Walking In Neighborhood at Night and Region",
       fill = "Fear of Walking at Night") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12))

#Using a table to get the counts for the new dataset
table(question7_region)

#Question 8: Determining if a relation exists between current family income and highest degree earned
#creating a new dataset to compare current family income to their highest degree earned. This can show a trend of the demographic of the labor force that may interest the nonprofit. 
question8 <- gssProject1 %>%
  select(currentFamIncome, highestDegree)

#Verifying new dataset
question8

#Plotting vertical bar graph 
ggplot(question8, aes(currentFamIncome, fill = highestDegree)) +
  geom_bar(position = "dodge") +
  labs(x = "Current Family Income",
       y = "Count",
       title = "Relation Between Current Family Income and Highest Degree Earned",
       fill = "Highest Degree") +
  theme_clean(base_size = 12) +
  theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
        axis.text.x  = element_text(size=10), 
        axis.text.y = element_text(angle = 0, size = 10), 
        axis.title.y = element_text(angle=0, size = 12, face = "bold", vjust = .5),
        legend.text = element_text(size = 10),
        legend.title = element_text(face="bold", colour="#000000", size=12)) +
  scale_fill_brewer(palette = "Dark2")

#Using a table to get counts for new dataset
table(question8)
