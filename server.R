####################################
#### Guna Pemmaraju - server.R 
### Coatings Additives DEMO
####################################

library(shiny)
library(plyr)
library(ggplot2)

source("sdb.R")
source("App1.R")


# Setup the Data




#Done Setup

shinyServer(function(input, output) { # server is defined within these parentheses

    
    sComps <- reactive({
        input$mychooser$right
    })

  
    output$programCloud <- renderPlot({
        cmp<-sComps()
        if (length(cmp)<2){
            cmp<-c("LUBRIZOL","DOW COATING", "BASF")
        }
        plotCloud(cmp,tdm)
        
    })
    

    
    
    output$ceramicValueChainPlot <- renderPlot({
        plotCeramicValueChain(input$selectedChainLinkType)    
    }, height=600)
    
    
    
   
})

