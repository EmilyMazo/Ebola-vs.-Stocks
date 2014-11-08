library(shiny)

shinyUI(fluidPage(
        titlePanel("Ebola Cases vs. Stock Prices"),
        sidebarLayout(
                sidebarPanel(
                        p("Use this app to compare confirmed Ebola cases in West Africa to stock prices."),
                        br(),
                        p("I suggest looking at SPY and DOW, two general indices, as well as 
                          NBI (NASDAQ Biotech Index."),
                        helpText("Select a stock or Index to examine. 
                                 Information will be collected from yahoo finance."),
                        
                        textInput("symb", "Symbol", "SPY"),
                        
                        
                        actionButton("get", "Get Stock"),
                        
                        br(),    
                        br(),
                        
                        checkboxInput("log", "Plot y axis on log scale", 
                                      value = FALSE),
                        checkboxInput("adjust", 
                                      "Adjust prices for inflation", value = FALSE)
                        ),
                
                mainPanel(plotOutput("plot1"),
                          plotOutput("plot2"))
        )
))