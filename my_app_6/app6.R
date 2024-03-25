# Load packages

library(shiny)
library(ggplot2)

setwd("~/Documents/GitHub/meu_primeiro_shiny-dashboard/my_app_6")

# Get the data
# Did it only test with mtcars

mtcars <- mtcars
save(mtcars, file = "mtcars.RData")

# Load data

load("mtcars.RData")

# Define UI

ui <- fluidPage(
  
  sidebarLayout(
    
    # Inputs: Select variables to plot
    sidebarPanel(
      
      # Select variable for y-axis
      selectInput(
        inputId = "y",
        label = "Y-axis:",
        choices = c("mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb"),
        selected = "mpg"
      ),
      # Select variable for x-axis
      selectInput(
        inputId = "x",
        label = "X-axis:",
        choices = c("mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb"),
        selected = "disp"
      )
    ),
    
    # Output: Show scatterplot
    mainPanel(
      plotOutput(outputId = "scatterplot")
    )
  )
)

# Define server

server <- function(input, output, session) {
  output$scatterplot <- renderPlot({
    ggplot(data = mtcars, aes_string(x = input$x, y = input$y)) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE) 
  })
}

# Create a Shiny app object

shinyApp(ui = ui, server = server)


