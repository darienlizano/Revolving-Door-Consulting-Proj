# Revolving-Door-Consulting-Proj
* Goal of this report is to answer a number of questions with a narrative for my audience to be able to understand my visualizations 
* Utilized a provided sample survey to answer the organization's key questions 
* Performed Data Cleaning, Data Wrangling, and Exploratory Data Analysis

## Language and Resources Used
**R**
**Packages**: dpylr, readr, ggplot2, viridis, RColorBrewer, ggthemes, ggrepel

## Dataset
We are using the provided csv file which is a subset of the variables collected for the *General Social Survey* (GSS) 

## Report
This project can be found as a [report](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/Project1Final_without_output_code.pdf) in a pdf file

## Questions That Were Asked by the Nonprofit
The following are the proposed question by the nonprofit that my firm seeked answers for:

1.  What was the final sample size and what is the general demographic composition of the sample?
2.  Does the sample include a fair representation of race within each region of the country?
3.  Is the number of hours usually worked in a week related to any of the following: trouble sleeping, job stress, job satisfaction, health, and happiness?
4.  What is the relationship between the number of hours spouses usually work each week? That is, as one spouse works more, does that mean the other spouse works less? Or, vice versa?
5.  Does the amount of time that people spend on email each week vary as a function of the highest degree that they’ve earned? That is, do people with more education, have jobs where they spend more time on email?
6.  Do people who live alone work more than people who live with others in their household?
7.  Is fear of walking in one’s own neighborhood at night related to any of the following: current family income, age, sex, race, or region?
8.  Is there a relationship between one's current family income and their highest degree earned?

## Data Cleaning
Luckily, this dataset was fairly clean. The only data cleaning performed was to remove missing variables within each of my objects created

## Data Wrangling
After importing the dataset, I needed to transform the data to be able to analyze it for the questions that were being asked. This was done in the following steps:

* Created new objects for each question posed
* Filtered, Grouped, and Selected relevant variables for each question
* Summarized numerical variables for errorbar plots
* Created count tables for the variables within certain objects 

## Exploratory Data Analysis 
There were several visulizations that were created to answer the questions that were asked. A few examples of my graphs will be shown below. All graphs will be presented in my [report](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/Project1Final_without_output_code.pdf).

## Findings 
* The general demographic contains a mix of groups from backgrounds such as: sex, socioeconomic backgrounds, origin, race, and age.
* The majority demographic are Females who identify as White, within the ages of 30-40, who are currently married
* The representation of race is not fair within this sample since the majority of recipients identify as White
* There exists a relation between hours that someone usually works per week and difficulty sleeping, Stress caused by their jobs, job satisfaction, health, and happiness
* A relation exists between the hours the surveyee and their spouses work per week
* A relation exists one's highest degree earned and the amount of time they spend on their emails
* A relation exists between average hours worked and their household size 
* A relation exists between a fear of walking alone in their neighborhood at night and age and sex, but not with current family income and region
* A relation exist between current family incomes and highest degree earned
