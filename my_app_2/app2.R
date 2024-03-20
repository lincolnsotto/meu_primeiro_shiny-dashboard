library(shiny)

# Definindo a UI
ui <- fluidPage(
   titlePanel("censuVis"),
   
   
   sidebarLayout(
     
      sidebarPanel(
        
        helpText("Gráfico  com informações do Censo 2010"),
        
        selectInput(
                    "variavel", h3("Escolha a variável para mostrar:"), 
                    choices = list("Escolha 1" = 1, 
                                   "Escolha 2" = 2, 
                                   "Escolha 3" = 3),
                                   selected = 1),
        
        sliderInput("range", label = ("Escolha o intervalo:"), 
                    min = 0, 
                    max = 100, 
                    value = c(0, 100)),
      ),
      
      mainPanel(
        textOutput("var_selecionada"),
        textOutput("range_selecionado")
      )
    )
  )


# Definindo lógica do servidor
server <- function(input,output){
  output$var_selecionada <- renderText({
    paste("Você escolheu a variável", input$variavel)
  })
  output$range_selecionado <- renderText({
    paste("Você escolheu o intervalo", input$range[1], "a", input$range[2])
  })
}

# Carregando o aplicativo
shinyApp(ui = ui, server = server)

