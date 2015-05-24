library(shiny)

library(ggplot2)
mean_kcal_new<<-0

shinyServer(
        function(input, output) {
        

         newPlot <- reactive({
                 #new manipulated BMI                 
                 newBMI <-round(rnorm(sample_n, mean = input$BMI, sd = input$BMIsd),2)                
                 data$xBMI <-newBMI
                 
                 #new weight based on new BMI
                 newWeight <-newBMI  * BMIfactor
                 
                 #new kcal based on new weight
                 newKcal <- round(newWeight * 13.7516 + dataHeight * 5.0033 + dataAge * 6.755 + 66.4730)
                 data$xkcal <-newKcal
                 mean_kcal_new<<-mean(newKcal)
                #x <- data[, 1] 
                #y <-data[,6]
                x <-data$kcal
                y <-data$xkcal
                v<- append(x,y)
                z<-append(rep("Original",sample_n),rep("UserSet",sample_n))
                plotData <-data.frame(z,v)
                library(plyr)
                cplotData <- ddply(plotData, "z", summarise, mean=mean(v))

                
                ggplot(plotData, aes(v, fill=z)) +
                        geom_density(alpha=0.5) +
                        geom_vline(data=cplotData, aes(xintercept=mean,  colour=z),
                           linetype="solid", size=1) 
                })

        output$dataPlot <- renderPlot({
               
                newPlot()
                })
        output$bmi_mean <- renderPrint({ 
                bmi_mean
        })
        output$bmi_mean_c <- renderPrint({ 
                input$BMI
        })
        output$totalOriginalKcal <- renderPrint({ 
                input$popu * mean(data$kcal)
        }) 
        output$totalChangedKcal <- renderPrint({ 
                input$popu * mean_kcal_new
        })
        output$totalOriginalCosts <- renderPrint({ 
                input$popu * mean(data$kcal) * input$kcalCosts +
                        (input$BMI*0)
        })
        output$totalChangedCosts <- renderPrint({ 
                input$popu * mean_kcal_new * input$kcalCosts +
                (input$BMI*0)
        })
        output$costDiff <- renderPrint({ 
                input$popu * mean_kcal_new * input$kcalCosts -
                input$popu * mean(data$kcal) * input$kcalCosts +
                 (input$BMI*0)
        })
        }
)