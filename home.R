
#install.packages("devtools")
#install.packages("roxygen2")
#install.packages("shiny")
#install.packages("shinythemes")
#install.packages("ggplot2")
library(devtools)
library(roxygen2)
library(shiny)
library(shinythemes)

ui <- fluidPage(theme = shinytheme("superhero"),
                navbarPage("Home Affordability Calculator:",
                           tabPanel("Home",
                                  # Input values
                                    sidebarPanel(
                                      HTML("<h3>Your Debt to Income</h3>"),
                                      sliderInput("Debt",
                                                  label = "Average Monthly Debt",
                                                  value = 2000,
                                                  min = 0,
                                                  max = 10000),
                                      sliderInput("Income",
                                                  label = "Monthly Gross Income",
                                                  value = 4000,
                                                  min = 0,
                                                  max = 10000),

                                      actionButton("submitbutton",
                                                   "Calculate Home Affordability!",
                                                   class = "btn btn-primary")
                                    ),#EndSliderbar

                                    mainPanel(
                                      helpText(p("Click and Draw Scales to adjust your estimated Monthly Debts (Estimated Mortage, Credit Cards, Bills, Etc) and your Monthly Gross Income (Total pay before Taxes).
                                      As you drag the slider you will see if you can Afford a Home Monthly.Be sure to Hit the Calculate Button to return your Debt to Income (DTI) Ratio each time you adjust the slider.
         Hint: If your DTI is Less than 45, this is good!")),
                                      tags$label(h3('Can you Afford a Home?')),
                                      verbatimTextOutput('afford'),
                                      tableOutput('tabledata') # Results table
                                    ) # mainPanel()

                           )#tabPanel()
                )#End Navbar

)
# End of fluidPage()

#SERVER Portion
server <- function(input, output, session) {

# Input Data
  Debt2Income <- reactive({
    DTI <- (input$Debt/(input$Income) *100)
    DTI <- data.frame(DTI)
    names(DTI) <- "DTI"
    print(DTI)
  })#Endreactive


# Output Text Box
  output$afford <- renderPrint({
    if ((input$Debt/(input$Income)*100) > 45){
      print("Home is not affordable")
    } else {
      return("Congratulations Home is affordable")
    }
  })

# Results
  output$tabledata <- renderTable({
    if (input$submitbutton>0) {
      isolate(Debt2Income())
    }
  })

} #END OF SERVER FUNCTION

#RUN SHINY APP
shinyApp(ui = ui, server = server)






