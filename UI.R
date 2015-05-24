library(shiny)

#shinyUI(pageWithSidebar(
#        headerPanel("Developing Data Products: Course Project"),
#        sidebarPanel(
shinyUI(fluidPage(
title = "The Kcal Consuming Simulator",
h1("Developing Data Products:"),
h2("The Kcal Consuming Simulator"),
h2("Coursera Course Project 2015"),
h3("by Jyrki Kankaanpaa"),
hr(),
h2("Introduction"),
p("The world population is  gaining more and more weight, year by year. 
  The obesity starts to be a big problem all-over the world. "),
a(href="http://en.wikipedia.org/wiki/Obesity", target="_blank","Obesity"),
p("With this small Shiny app, The Kcal Consuming Simulator, you can test how changing of the population average BMI Body Mass Index effects total kcal consuming and food costs, among the Finnish men age 25-74."),
a(href="http://en.wikipedia.org/wiki/Body_mass_index", target="_blank","BMI"),
h2("Application And Data"),


p(" This app uses simulated base data which is made by rnorm function with parameters taken from"),
a(href="https://www.thl.fi/fi/tutkimus-ja-asiantuntijatyo/vaestotutkimukset/finriski-tutkimus/the-national-finrisk-study",target="blank_","FINRISKI 2012 health study"),
p("FINRISK is Finnish population survey on risk factors on chronic, noncommunicable diseases. 
The study has been carried out every 5th year since 1972.Detailed information about the study you can find from the link above."),

h4(" For this Coursera course exercise I took parameters for next variables from FINRISK study."),
p(" 1. Height (men age 25-74, mean = 177, SD = 7)"),
p(" 2. BMI (men age 25-74, mean = 27.1, SD = 4,3)"),
p(" 3. Age (used same year frame than in the study 25 to 74, mean = 49.5, SD = 12.2)"), 

h4(" The next variables are calculated using those 3 variables."),
p(" 1. Weight in kg"),
p(" 2. kcal (theoretical kcal consuming at rest BMR)"),
p(" Weight calculation based on BMI and Height and calculated by following formula:"),
p(" (height in cm /100) * (height in cm /100) * BMI "),
p(" Kcal consuming based on Basal Metabolic Rate"),
a(href= "http://en.wikipedia.org/wiki/Basal_metabolic_rate",target="blank_" , "Harris-Benedict equation."),
p("For men BMR. Weight * 13.7516 + Height * 5.0033 + Age * 6.755 + 66.4730"),

h4(" The user can manipulate next variables."),

p(" 1. xBMI (user manipulated mean of BMI)"),
p(" 2. xBMIsd (user manipulated mean of BMI)"),
p(" 3. Population (which amount of people calculations will do)"),
p(" 4. Average costs per kcal"),


h2("How to use?"),
p("Using the Kcal Consuming Simulator app is very easy. Just change simulation selections at the left side panel and you can see results immediately in the right side of the simulation selection panel.The density plot reacts immediately when user manipulate BMI or BMI sd."),

p("The applcation automatically loads basic data n = 5000. That basic data used to calculates "),
#tags$li("yks","kaks")
p("The app prints out following calculated values"),
p("1. Original total kcal consumin in population (mean of kcal * Population)"),
p("2. Changed total kcal consumin in population  (mean of xkcal * Population)"),
p("3. Original total kcal costs in population (mean of kcal * Population *Cost per KCAL)"),
p("4. Changed total kcal costs in population (mean of xkcal * Population * Cost per KCAL)"),
p("5. Costs Difference (between 3. - 4.)"),
p("The app also prints out ggplot about kcal consuming densities and means of both original kcal consuming and user manipulated kcal consuming."),


h2("Application"),


 fluidRow(
column(3,
       h3('Simulation selections'),        
       sliderInput("BMI",
                   "Mean BMI",
                   min = 16,
                   max = 45,
                   value = 22.5),
       sliderInput("BMIsd",
                   "SD BMI",
                   min = 0.1,
                   max = 8,
                   value = 4.4),
       
       sliderInput("popu",
                   "Population:",
                   min = 100000,
                   max = 50000000,
                   value = 5000000),
       
       numericInput("kcalCosts",
                    "Cost per KCAL",
                    value = 1)
                
        ),


#        mainPanel(
column(4,
        h3("Values:"),
        p("Original BMI Mean"),
        verbatimTextOutput("bmi_mean"),
        p("Changed BMI Mean by user"),
        verbatimTextOutput("bmi_mean_c"),
        p("Original total kcal consumin in population"),
        verbatimTextOutput("totalOriginalKcal"),
       p("Changed total kcal consumin in population"),
        verbatimTextOutput("totalChangedKcal")),
column(4,
       hr(),
       hr(),
       p("Original total kcal costs in population"),
       verbatimTextOutput("totalOriginalCosts"),
       p("Changed total kcal costs in population"),
       verbatimTextOutput("totalChangedCosts"),
       p("Costs Difference"),
       verbatimTextOutput("costDiff"))
),
    p("In data plot belove you can see data densities and means of both data.
Original simulated data by the application and your manipulated kcal"),
                
        plotOutput("dataPlot")
))