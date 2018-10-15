library(shiny)

ui <- fluidPage(
   
   titlePanel("Blackjack Victory"),
   
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30),
         radioButtons('dist', 'Distribution type', choices = c('Gamma', 'Negative Binomial'))
      ),
      
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     
   })
}

shinyApp(ui = ui, server = server)

