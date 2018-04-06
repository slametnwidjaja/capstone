library(shiny)
library(shinydashboard)
library(plotly)
library(dplyr)
library(ggplot2)
library(reshape2)

# Define UI for our dashboard

dashboardPage(
  skin = "blue",
  dashboardHeader(
    title="Capstone",
    tags$li(a(href = 'https://www.linkedin.com/in/slametnwidjaja/',
              icon("linkedin"),
              title = "About the Author"),
            class = "dropdown"),
    
    tags$li(a(href = 'https://slametnwidjaja.wixsite.com/slametnw',
              icon("globe"),
                  title = "My Web"),
            class = "dropdown")
  ),
  
  dashboardSidebar(
    sidebarMenu(
      id="sidebar",
      menuItem("Welcome", tabName = "welcome", icon=icon("book")),
      menuItem("Summary Data", tabName = "summary", icon = icon("database")),
      menuItem("Graph", tabName = "graph", icon=icon("signal")),
      menuItem("Table Data", tabName = "table", icon=icon("table")),
      menuItem("About Me", tabName = "about", icon=icon("user-circle"))
    )
  ),
  
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")),
    
    tabItems(
      # Welcome page
      tabItem("welcome",
              h2("Welcome to my capstone"),
              h3("This page about Description the data"),
              p("Are you curious about fertilizer use in developing economies? The growth of Chinese steel exports? American chocolate consumption? Which parts of the world still use typewriters? You'll find all of that and more here. This dataset covers import and export volumes for 5,000 commodities across most countries on Earth over the last 30 years."),
              h3("Acknowledgements"),
              p("This dataset was kindly published by the United Nations Statistics Division on the UNData site. You can find the original dataset here."),
              h3("Inspiration"),
              p("Some of these numbers are more trustworthy than others. I'd expect that British tea imports are fairly accurate, but doubt that Afghanistan exported exactly 51 sheep in 2016. Can you identify which nations appear to have the most trustworthy data? Which industries?
                 License
                 Per the UNData terms of use: all data and metadata provided on UNdata’s website are available free of charge and may be copied freely, duplicated and further distributed provided that UNdata is cited as the reference."),
              p("Source : https://www.kaggle.com/unitednations/global-commodity-trade-statistics")
              ),
     
      # Summary page
     tabItem("summary",
             h3("Summary"),
             verbatimTextOutput("viewdata")
             ),
     
      # Graph page
      tabItem("graph",
              fluidRow(
                tabBox(
                  title = "Data Status", id = "tabset",selected = "Data",
                  tabPanel("Flow Data Mean",
                           radioButtons("flowbutton", label = h3("Select Fill"), 
                                        choices = c("Trade", "Weight","Quantity"), 
                                        selected = "Trade"),
                           plotlyOutput("flowmean", height = 700, width = 1000)
                  ),
                  tabPanel("Flow Data Sum",
                           radioButtons("flowbutton1", label = h3("Select Fill"), 
                                        choices = c("Trade", "Weight","Quantity"), 
                                        selected = "Trade"),
                           plotlyOutput("flowsum", height = 700, width = 1000)
                  ),
                  
                  tabPanel("Category Data Mean",
                           radioButtons("catbutton", label = h3("Select Fill"), 
                                        choices = c("Trade", "Weight","Quantity"), 
                                        selected = "Trade"),
                           plotOutput("catmean", height = 700, width = 1000)
                           ),
                  tabPanel("Category Data Sum",
                           radioButtons("catbutton1", label = h3("Select Fill"), 
                                        choices = c("Trade", "Weight","Quantity"), 
                                        selected = "Trade"),
                           plotOutput("catsum", height = 700, width = 1000)
                  ),
                  
                  
                  tabPanel("Year Data Mean",
                           radioButtons("yearbutton", label = h3("Select Fill"), 
                                      choices = c("Trade", "Weight","Quantity"), 
                                      selected = "Trade"),
                           radioButtons("yearbutton1", label = h3("Select Graph"), 
                                        choices = c("Collum", "Line"), 
                                        selected = "Collum"),
                           plotOutput("yearmean", height = 700, width = 1000)
                          ),
                  tabPanel("Year Data Sum",
                           radioButtons("yearbutton2", label = h3("Select Fill"), 
                                        choices = c("Trade", "Weight","Quantity"), 
                                        selected = "Trade"),
                           radioButtons("yearbutton3", label = h3("Select Graph"),
                                        choices = c("Collum", "Line"), 
                                        selected = "Collum"),
                           plotOutput("yearsum", height = 700, width = 1000)
                  )
              )
            )
      ),
      
      tabItem("table",
              h2("Table Data"),
              box(
                background = "blue",
                width=4,
                selectInput("select", label = h3("Select Data Table"), 
                            choices = c("Flow Data", "Category Data", "Year Data","Year,country,category Data"), 
                            selected = "Flow Data")
                ),          
                  tableOutput("table")
      ),
      
      tabItem("about",
              h2("Halloo"),
              h3("My name : Slamet Natalegam Widjaja"),
              h3("i'm studying data scientist in algorithm and being capstone stage. This is my capstone. If you have data that will be processed and analyzed please know me, so I can to practice with a lot of data in the process. please contact me in email or in other media. Thank you very much."),
              h3("Email : slametnwidjaja@gmail.com"),
              tags$h3(a(href ="https://github.com/slametnwidjaja","Github : https://github.com/slametnwidjaja")),
              tags$h3(a(href = "https://www.linkedin.com/in/slametnwidjaja/", "My linkedin : https://www.linkedin.com/in/slametnwidjaja/")),
              tags$h3(a(href = "https://slametnwidjaja.wixsite.com/slametnw","My web : https://slametnwidjaja.wixsite.com/slametnw"))
      
              
      )
      
    )
    
  )
  
  
  
)    
