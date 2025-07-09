install.packages("shiny")
install.packages("randomForest")
library(shiny)
library(randomForest)

# Train the model
model <- randomForest(Species ~ ., data = iris)

# Define UI
ui <- fluidPage(
  titlePanel("Iris Species Predictor - Datamining Practical TYIT 09/07/25"),
  sidebarLayout(
    sidebarPanel(
      numericInput("sepalLength", "Sepal Length:", value = 5.1),
      numericInput("sepalWidth", "Sepal Width:", value = 3.5),
      numericInput("petalLength", "Petal Length:", value = 1.4),
      numericInput("petalWidth", "Petal Width:", value = 0.2),
      actionButton("predictBtn", "Predict")
    ),
    mainPanel(
      h3("Prediction:"),
      verbatimTextOutput("prediction")
    )
  )
)

# Define server
server <- function(input, output) {
  prediction <- reactiveVal("No prediction yet.")
  
  observeEvent(input$predictBtn, {
    newData <- data.frame(
      Sepal.Length = input$sepalLength,
      Sepal.Width = input$sepalWidth,
      Petal.Length = input$petalLength,
      Petal.Width = input$petalWidth
    )
    
    pred <- predict(model, newData)
    prediction(as.character(pred))
  })
  
  output$prediction <- renderText({
    prediction()
  })
}

# Run the app

shinyApp(ui = ui, server = server)


