# Predicting Diabetes using machine learning models in R
Faithwin Gbadamosi
2024-10-25

# Introduction

Diabetes is a major health concern globally. Identifying and predicting
this disease in patients is the first step towards stopping their
progression.According to the statistics of the International Diabetes
Federation, about 537 million people worldwide (10.5% of the global
population) suffer from diabetes, and it is estimated that 643 million
people will develop the condition (11.3% of the total population) by
2030. If this trend continues, the number will jump to 783 million
(12.2%) by 2045.

# Problem / Question

Prediction of diabetes from the onset can help healthcare providers take
early preventive measures. This project aims to build a predictive model
for diabetes using readily available patient data and key variables,
such as pregnancies, glucose levels, BMI, and genetic factors.

In addition, I will create visual summaries to communicate the insights
and patterns identified in the data. The major objectives include:

1.  Collecting and cleaning the diabetes dataset with relevant health
    variables.
2.  Applying machine learning algorithms, such as logistic regression or
    random forest, to predict diabetes cases.
3.  Creating visual summaries to show the relationships between key
    variables.
4.  Finally, evaluating model performance using metrics such as
    accuracy, precision, recall, and ROC-AUC scores.

# Inspiring Examples

## Example 1

![](https://cdn.ncbi.nlm.nih.gov/pmc/blobs/0481/10057336/07cc7896f6fc/jpm-13-00406-g004b.jpg)

This shows the distribution of diabetes from a dataset used in a
research paper.Visualization tools were employed to explore the
distribution of data for diabetic patients and to identify correlations
between diabetes and other relevant variables. This type of graphic
could be produced and enhanced in R using ggplot.

## Example 2

![](https://www.kaggleusercontent.com/kf/196234644/eyJhbGciOiJkaXIiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0..KAEnfiHn9Xn73DsYTBAaCQ.EDVzNHgKrf4wKnU7tKL7cDu6MctUEOUlfoaL1vynbihpT3cEofEMIAkVcR5w6IZ_OGpv6DUMF17GQR5f6auYXcL1AQCA0SxFxxcidC1b9YB-g6g61Ex1-xJG4fnJwuvTUHOpkfUk1XsPQulNJhQ8q7Yz84Vfjas_djEq9xmg5Zf50FISHgaRJboqsZit7mIbX5eRGkkc6MXj1NZEl-H15IF3UxiGDImIpJ2oSv6rIs1_pbOxHqGCsuCYfDht4WEKIEe8pFEp4aAEo9LUunL4F8dcJn8WuZJ-fH2biRZ8-eWCkyqiYhU5hmscFBaDRqXjnLf1FtbSFKcZaJ-8YanZKhCKrzmdbaLFW0-GFJZwxCknv38_Z_B3R3rUh-WJFig8VrvqQkISRXebQoGuG46lxd3AHPBFfzhDt2tY0WJ9IhbPm0xSB8rBrWvGBujoUuP8Rglp5fF3tszHOfCwuNVWF6CxjA_VXJu-FiL-F2J5FSz-3N2-0eQAFif_QY4Yz3nouhMEFGd2-4AzhMyDeTabV1ZtNAoEIANPb5ji-pwyhvPdl8vG39RZWxEHwjIggNU9QyB6KDB9jjlYTctIHPaQrnTehvDpFVYFld7yMyGYR8zqz4788sehGKqF2rzKzk5f8jHc4EwajXV-xQcgiGvHfa5NDtOsmAmmdEoMwur--ythjW6dpdykM109_2KsnEXV.qUNkQIFUTlUeMPLkGW-wlQ/__results___files/__results___19_0.png)

This is a correlation matrix that shows the relationship between
different variables. It is from a similar study on Kaggle and can be
recreated in R for my project.

## Example 3

![](https://github.com/Aditya-Mankar/Diabetes-Prediction/blob/master/screenshot.jpg?raw=true)
This is a screenshot from a project that predicted diabetes and created
a web app using Flask which is a python micro framework. I thought this
was interesting.

# Proposed data sources

Data will be gotten from the National Institute of Diabetes and
Digestive and Kidney Diseases. This data is retrospective and may not be
used if not comprehensive. The project has a backup dataset found in a
study
(https://drive.google.com/file/d/1eAplOYO-k7ZYHj4uHAY1tEr8VTeaxS6u/view?usp=sharing)
by Chou et al.,(2023). Both dataset contains the following variables: 1.
Pregnancies: Number of times pregnant 2. Glucose: Plasma glucose
concentration a 2 hours in an oral glucose tolerance test 3.
BloodPressure: Diastolic blood pressure (mm Hg) 4. SkinThickness:
Triceps skin fold thickness (mm) 5. Insulin: 2-Hour serum insulin (mu
U/ml) 6. BMI: Body mass index (weight in kg/(height in m)^2) 7.
DiabetesPedigreeFunction: Diabetes pedigree function 8. Age: Age (years)
9. Outcome: Class variable (0 or 1)

# Proposed methods

The following methods and processes will be implemented in this project:

1.  Data Collection and Preprocessing: The dataset for this project
    contains information on pregnancies, glucose levels, BMI, insulin,
    age, and other columns. The first step will be to clean the data and
    check for missing values.

2.  Exploratory Data Analysis: Descriptive statistics and
    visualizations, including density plots, boxplots, histograms, and
    correlation heatmaps, will be generated using the ggplot2. The
    figures will help us understand patterns in the data, such as the
    relationship between glucose levels and the likelihood of diabetes.

3.  Model Development: We would either use a Random Forest classifier or
    logistic regression model to predict diabetes. This algorithms are
    good for handling complex interactions between variables and for
    avoiding overfitting.

4.  Evaluation: After the development, the models will be tested using
    accuracy, precision, recall, F1-score, and ROC-AUC. A train-test
    split or cross-validation approach will be used to ensure the
    robustness of the model performance.

5.  Visualization and Reporting: Visualizations will then be created to
    include feature importance plots and ROC curves. A Quarto document
    will be created to automatically generate reports in various formats
    (HTML, Word, PowerPoint, PDF), allowing the results to be easily
    shared and presented.

# Expected results

This project expects to develop a very accurate diabetes prediction
model and create intuitive and visualizations to explain the complex
relationships between various health factors and diabetes risk. By
automating the reporting process with Quarto, the model will be then
continuously be updated as new data becomes available. That way, we are
providing healthcare professionals with timely insights to assess and
manage diabetes risk effectively.
