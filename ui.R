####################################
#### Guna Pemmaraju - ui.R 
### Coatings Additives DEMO
####################################

library(shiny) 
source("chooser.R")

shinyUI(pageWithSidebar( 
    
    #headerPanel("Lightweighting Analytics Beta"), 
    h3("Coatings Additives Beta"), 
    
    sidebarPanel(
        
         conditionalPanel(condition="input.conditionedPanels==1",
                         chooserInput("mychooser", "Available", "Selected",
                                      allComps, c("LUBRIZOL","DOW COATING", "BASF"), size = 10, multiple = TRUE
                         )
                         
        ),
  
        
        # Tab 4 is hidden now
        conditionalPanel(condition="input.conditionedPanels==4",
                         #selectInput('selectedChainLinkType', 'Choose Value Chain Link Type',chainlinkTypes, selected=chainlinkTypes[1]),
                         selectInput('selectedChainLinkType', 'Choose Value Chain Link Type',chainlinkTypes, selected="Tile"),
                         br()
                         
        ),
        
        
        
        conditionalPanel(condition="input.conditionedPanels==99",
                         
                         h2("Help Documentation")
                         
                         
        )
        
    ),
    
    
    
    mainPanel(
        tabsetPanel(id = "conditionedPanels", 
                    tabPanel("Interactions", value =4, plotOutput("ceramicValueChainPlot",height="600px")),
                    tabPanel("Competitor Focus", value =1, plotOutput("programCloud", height="600px")),
                    tabPanel("Help", value =99, 
                             p("This website is about understanding the Coatings and additives value Chain. With specific focus on the ink manufacturers' value chain in China"),
                             p("It has 2 tabs."),
                             br(),
                             br(),
                             p("1. Interactions."),
                             p("This tab is showing the relatives scores of various ink manufacturers, on the selected value chain axis. Please change the selection in the drop down box to see the changes. Note that the baloons are color coded by the location "),
                             br(),
                             br(),
                             p("2. Competitor Focus"),
                             p("This tab shows the focus of each of the computetitors as a word cloud. The left side selection boxes help select the competitors. And based on that the word cloud is created. This is very helpful in understanding the focus areas of various competitors in the Industry."),
                             br(),
                             br(),
                             br(),
                            h5("Note: please give a second or two for each of the screens to render")    



                            )



        )
    )
))