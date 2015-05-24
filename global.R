
#creating simulated sample data with parameters which based on FINRISK2012 study
set.seed(1234)
sample_n <-5000
bmi_mean<-27.1
headers<-c("BMI","kcal","Height","Weight","Age","xBMI","xkcal")
dataBMI <-round(rnorm(sample_n, mean = bmi_mean, sd = 4.4),1)
dataHeight <-round(rnorm(sample_n, mean = 178, sd = 7))
dataAge <-round(rnorm(sample_n, mean = 49.5, sd = 12.2))
BMIfactor<-(dataHeight/100) * (dataHeight/100)
dataWeight <-round((dataBMI  * BMIfactor),2)

dataKcal <- round(dataWeight * 13.7516 + dataHeight * 5.0033 + dataAge * 6.755 + 66.4730)
xKCAL <-dataKcal
xBMI <-dataBMI

data <- data.frame(dataBMI,dataKcal,dataHeight,dataWeight,dataAge,xBMI,xKCAL)
colnames(data) <- headers

