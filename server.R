library(shiny)

# Define server logic required to draw a simulation of a Galton Box.
shinyServer(function(input, output) {
   
        output$distributionPlot <- renderPlot({

                # From which bin starting?
                binStart <- (input$bins/2)
                
                # Initialization of matrix (balls x layers)
                m <- rep(0, input$layers*input$balls)
                dim(m) <- c(input$balls,input$layers)
                
                # simulation with rbinom()
                for (i in 1:input$balls) {
                        m[i,] <- rbinom(input$layers, 1, .5 + input$realcoef)
                }
                # 1 go right, 0 go left so change 0 to -1 
                m[m == 0] <- -1
                # how may total steps left/right?
                ss <- rowSums(m)
                # if ball reach box limits, drop to extreme bins
                ss[ss < -binStart] <- -binStart
                ss[ss > binStart] <- binStart
                
                # draw simulation
                hist(ss+binStart+.1, breaks = input$bins-1,
                     xlab = "",
                     main = paste("Simulation of Galton Box with",
                                     input$layers,
                                     "layers and",
                                     input$balls,
                                     "balls"))

                                
        })
  
})
