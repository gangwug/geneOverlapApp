###load 'shiny' package
if (!require(shiny)) {
  install.packages("shiny")
}
library(dplyr)
### setting this option. Here we'll raise limit to 100MB.
options(shiny.maxRequestSize = 100*1024^2)

###set a flag for 'Run' button
runflag <- 0
shinyServer(function(input, output) {
  datasetInput <- reactive({
    ## Change when the "update" button is pressed
    if ( input$update > runflag) {
      isolate({
        withProgress({
          listA <- unlist(strsplit(gsub("\\s+","",input$geneA), ","))
          listB <- unlist(strsplit(gsub("\\s+","",input$geneB), ","))
          listAB <- intersect(listA, listB)
          numa <- length(listA)
          numb <- length(listB)
          numab <- length(listAB)
          numD <- data.frame(number = c(numa, numb, numab), 
                             ratio = c(numab/numa, numab/numb, numab/length(unique(c(listA, listB)) ) )) %>% 
                  dplyr::mutate(name = c("listA", "listB", "overlap")) %>%
                  dplyr::select(name, number, ratio)
          outD <- numD
        })
      })
      runflag <- input$update
      return(outD)
    }  else  {
      return(NULL)
    }
  })
  output$tabout <- renderTable({
    taboutD <- datasetInput()
    head(taboutD)
  })
})
