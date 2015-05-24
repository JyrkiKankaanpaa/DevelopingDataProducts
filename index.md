---
title       : Developing Data Products
subtitle    : Coursera Course Project 2015 Shiny Application
author      : Jyrki Kankaanpaa
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

---
## Coursera Course Project 2015 Shiny Application

My Coursera course project application is "The Kcal Consuming Simulator".
The application first creates simulated data of Finnish men ages of 25 to 74.

The data including:

1. BMI (Body mass index)
2. Energy consuming in kcal
3. Height in cm
4. Weight in kg
5. Age in years

---

## The Application Data And Variables


Application simulated data creating parameters based on finrisk 2013 study.

For next 3 variables parameters was took from [finrisk 2012 nutridion study](http://www.julkari.fi/handle/10024/110839).

1. BMI (Body mass index)
2. Height 
3. Age

---
##  The Application Data And Variables


Rest of the variables was creating with those 3 earlier.

1. Weight = BMI * (Height/100 * Height/100)

2. kcal = Weight * 13.7516 + Height * 5.0033 + Age * 6.755 + 66.4730
        Estimating formula based on [Harris-Benedict Equation](http://en.wikipedia.org/wiki/Basal_metabolic_rate)


---
## Example Calculations

Two example calculations.

First weight
Height = 177
BMI = 27


```r
Height <- 177
BMI <- 27
(Height/100) * (Height / 100) *BMI
```

```
## [1] 84.5883
```

Second kcal


```r
Weight <- 100
Height <- 177
Age <- 55

Weight * 13.7516 + Height * 5.0033 + Age * 6.755 + 66.4730
```

```
## [1] 2698.742
```


