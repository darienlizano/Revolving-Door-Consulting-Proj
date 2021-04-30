# Revolving-Door-Consulting-Proj
* As the director of my own fictional consulting business, a non-profit organization contracted us to answer some of their questions using data analytics and visualization. 
* Utilized provided sample survey to answer the organization's key questions 
* Performed Data Cleaning, Data Wrangling, and Exploratory Data Analysis

## Language and Resources Used
**R**
**Packages**: dpylr, readr, ggplot2, viridis, RColorBrewer, ggthemes, ggrepel

## Dataset
We are using the provided csv file which is a subset of the variables collected for the *General Social Survey* (GSS) 

## Report
This project can be found as a report(https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/Project1Final_without_output_code.pdf) in a pdf file

## Data Cleaning
Luckily, this dataset was fairly clean. The only cleaning I needed to do was to remove missing variables within each of my objects created

## Data Wrangling
After importing the dataset, I needed to transform the data to be able to analyze it for the questions that were being asked. This was done in the following steps:

* Created new objects for each question posed
* Filtered, Grouped, and Selected relevant variables for each question
* Summarized numerical variables for errorbar plots
* Created count tables for the variables within certain objects 

## Exploratory Data Analysis 
There were several visulizations that were created to answer the questions that were asked. Examples of these visualizations will be displayed below

## Questions That Were Asked by the Nonprofit

### Question 1: What was the final sample size and what is the general demographic composition of the sample?
#### Final Sample Size
By simply using the count() function, we are able to see that the final sample size is 2,348 survey recipients.

#### General Demographic of Sample
To understand the general demographic of this survey, I visualized the variables race, sex, age, and marital status

##### Race
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/distribution_of_race.png)

##### Sex
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/distribution_of_sex.png)

##### Age
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/distribution_of_age.png)

##### Marital Status
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/distribution_of_martstatus.png)

### Question 2: Does the sample include a fair representation of race within each region of the country?
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/race_within_region.png)

### Question 3: Is the number of hours usually worked in a week related to any of the following: trouble sleeping, job stress, job satisfaction, health, and happiness?
For this questions, I am specifically looking for trends in the visualizations, as well as looking at the summary statistics for insights.

#### Trouble Sleeping
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/hrs_sleeping.png)

#### Job Stress
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/hrs_stress.png)

#### Job Satisifaction
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/hrs_satis.png)

#### Health
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/hrs_satis.png)

#### Happiness
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/hrs_health.png)

### Question 4: What is the relationship between the number of hours spouses usually work each week? That is, as one spouse works more, does that mean the other spouse works less? Or, vice versa?
For this question, I obsevered that the relevant variables are both numerical. Therefore, the best graph choice will be a scatterplot to understadn the relationship between the number of hours spouses usually work each week, and vice versa

**Note:** I used the geom_jitter function due to the points being over-plotted

![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/hrs.spouse.png)

### Question 5: Does the amount of time that people spend on email each week vary as a function of the highest degree that they’ve earned? That is, do people with more education, have jobs where they spend more time on email?

![alt.text]()

