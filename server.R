# server.R

library(quantmod)
library(xlsx)
library(ggplot2)
source("helpers.R")
cases <- read.xlsx("Ebola_Cases.xlsx", "Ebola_Cases")
cases$Date <- as.character(cases$Date)

shinyServer(function(input, output) {

        dates <- c((cases$Date[1] = "2014-11-04"), (cases$Date[18] = "2014-8-25"))
        
        dataInput <- reactive({
                data <- getSymbols(input$symb, src = "yahoo", 
                                   from = dates[2],
                                   to = dates[1],
                                   auto.assign = FALSE)
        })
        
        StockPrices <- reactive({
                if (!input$adjust) return (dataInput())
                adjust(dataInput())
        })
        
        output$plot1 <- renderPlot({
                chartSeries(StockPrices(), theme = chartTheme("white"), 
                            type = "line", log.scale = input$log, TA = NULL)
        })
        
        output$plot2 <- renderPlot({
                qplot(cases$Date, cases$TotalCases, data=cases) + xlab("Date of Reporting") + 
                      ylab("Number of Total Cases Recorded") + ggtitle("Recorded Ebola Cases in West Africa (WHO)")
                
        })
})