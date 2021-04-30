# Revolving-Door-Consulting-Proj
* As the director of my own fictional consulting business, a non-profit organization contracted us to answer some of their questions using data analytics and visualization. 
* Utilized provided sample survey to answer the organization's key questions 
* Performed Data Cleaning, Data Wrangling, and Exploratory Data Analysis

## Language and Resources Used
**R**
**Packages**: dpylr, readr, ggplot2, viridis, RColorBrewer, ggthemes, ggrepel

## Dataset
We are using the provided csv file which is a subset of the variables collected for the *General Social Survey* (GSS) 

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


