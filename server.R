library(shiny)
library(plotly)
library(dplyr)
library(ggplot2)
library(reshape2)
source("help/chart.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$viewdata <- renderPrint({
    viewdata
  })  

  output$flowmean <- renderPlotly({
      switch(input$flowbutton,
          "Trade" = flowtrademean,
          "Weight" = flowweightmean,
          "Quantity" = flowqtymean
      )
    })

  output$flowsum <- renderPlotly({
    switch(input$flowbutton1,
           "Trade" = flowtradesum,
           "Weight" = flowweightsum,
           "Quantity" = flowqtysum
    )
  })  


  output$catmean <- renderPlot({
    switch(input$catbutton,
           "Trade" = cattrademean,
           "Weight" = catweightmean,
           "Quantity" = catqtymean
    )
  })
  
  output$catsum <- renderPlot({
    switch(input$catbutton1,
           "Trade" = cattradesum,
           "Weight" = catweightsum,
           "Quantity" = catqtysum
    )
  })      
  
  
  output$yearmean <- renderPlot({
    if(input$yearbutton == "Trade" & input$yearbutton1 == "Collum"){
      yeartrademeancol
    }else if(input$yearbutton == "Trade" & input$yearbutton1 == "Line"){
      yeartrademeanline
    }else if(input$yearbutton == "Weight" & input$yearbutton1 == "Collum"){
      yearweightmeancol
    }else if(input$yearbutton == "Weight" & input$yearbutton1 == "Line"){
      yearweightmeanline
    }else if(input$yearbutton == "Quantity" & input$yearbutton1 == "Collum"){
      yearqtymeancol
    }else if(input$yearbutton == "Quantity" & input$yearbutton1 == "Line"){
      yearqtymeanline
    }
    
  })
  
  output$yearsum <- renderPlot({
    if(input$yearbutton2 == "Trade" & input$yearbutton3 == "Collum"){
      yeartradesumcol
    }else if(input$yearbutton2 == "Trade" & input$yearbutton3 == "Line"){
      yeartradesumline
    }else if(input$yearbutton2 == "Weight" & input$yearbutton3 == "Collum"){
      yearweightsumcol
    }else if(input$yearbutton2 == "Weight" & input$yearbutton3 == "Line"){
      yearweightsumline
    }else if(input$yearbutton2 == "Quantity" & input$yearbutton3 == "Collum"){
      yearqtysumcol
    }else if(input$yearbutton2 == "Quantity" & input$yearbutton3 == "Line"){
      yearqtysumline
    }
  })
  
  
  output$table <- renderTable({
    switch(input$select, 
           "Flow Data"= tableflow,
           "Category Data"= tablecat,
           "Year Data"= tableyear,
           "Year,country,category Data"=table3)
  })

})
