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

## A Bonus Question:
Towards the completion of my analysis, what piqued my interest was to see if there exists a relationship between one's current family income and their highest degree earned. I took the initiative to analyze this for the nonprofit, for I believe it may be useful for their research.


## Data Cleaning
Luckily, this dataset was fairly clean. The only cleaning I needed to do was to remove missing variables within each of my objects created

## Data Wrangling
After importing the dataset, I needed to transform the data to be able to analyze it for the questions that were being asked. This was done in the following steps:

* Created new objects for each question posed
* Filtered, Grouped, and Selected relevant variables for each question
* Summarized numerical variables for errorbar plots
* Created count tables for the variables within certain objects 

## Exploratory Data Analysis 
There were several visulizations that were created to answer the questions that were asked. A few examples of my graphs will be shown below. All graphs will be presented in my [report](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/Project1Final_without_output_code.pdf).

### Distribution Of Race Within Each Region Using A Stacked-Bar Chart
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/race_within_region.png)

### Relationship Between The Hours One Usually Works And Their Difficulty In Sleeping
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/hrs_sleeping.png)

### Relationship Between The Hours One Usually Works And The Hours Their Spouse Usually Works
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/hrs.spouse.png)

### Relationship Between's One's Current Family Income And Their Fear Of Walking Alone In Their Neighborhood At Night
![alt.text](https://github.com/darienlizano/Revolving-Door-Consulting-Proj/blob/main/famincome_walkingnight.png)
