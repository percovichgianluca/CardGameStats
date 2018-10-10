library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Blackjack"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("n",
                  "Number of draws:",
                  min = 1,
                  max = 1000,
                  value = 50),
      radioButtons('size', 'Number of cards per draws',
                   choices = 1:10,selected = 2),
      actionButton("button", "Re-run", icon("refresh")),
      p("Click the button to re-run the simulation.")
    ),
    
    
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  simulation <- function(input) {
    output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      draw <- c(rep.int('Ace', 4), 
                rep.int(as.character(2:10), 4), 
                rep.int('Face', 12))
      hands <- c()
      for (i in 1:input$n){
        s <- sample(x = draw, size = input$size, replace = FALSE)
        hands <- c(hands,s)
      }
      plot(table(hands), xlab = 'Card', ylab = 'Count')
    })
  }
  # initialize plot
  simulation(input)
  # re-simulate if refresh button pressed
  observeEvent(input$button,
               simulation(input)
  )
}

# Run the application 
shinyApp(ui = ui, server = server)

