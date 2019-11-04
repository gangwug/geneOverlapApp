library(shiny)
##uploading file
shinyUI(fluidPage(
  titlePanel(h2("Welcome to IntersectApp") ),
  sidebarLayout(
    
    sidebarPanel(
      
     fluidRow(
       column(6,
              textInput("geneA", label=h5("listA"), value="geneListA") )
     ),
     fluidRow(
       column(6,
              textInput("geneB", label=h5("listB"), value="geneListB") )
     ),
     br(),
     br(),
     fluidRow(
       column(6,
              actionButton("update", label=h5("Run")) )
     )
    ),
    
    mainPanel(
      helpText(h4('Step1: paste') ),
      br(),
      helpText(h4('Step2: run') ),
      helpText(h5('Please click Run button.') ),
      br(),
      helpText(h4('Step3: check') ),
      helpText(h5('The analysis results') ),
      tableOutput('tabout')
    )
  )
))
