library(shiny)

# Define UI for application that draws a simulation of a Galton Box
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Galton Box emulator"),
  
  # Sidebar with a slider input for number of balls,bins, layers and asymmetry coefficient 
  sidebarLayout(
    sidebarPanel(
            
            sliderInput("balls",
                        "Number of balls:",
                        min = 50,
                        max = 500,
                        value = 200),
            
            sliderInput("bins",
                        "Number of bins:",
                        min = 5,
                        max = 12,
                        step = 1,
                        value = 9),

            sliderInput("layers",
                        "Number of layers:",
                        min = 5,
                        max = 12,
                        value = 6),

            sliderInput("realcoef",
                        "Asymmetry Coefficient:",
                        min = -0.25,
                        max = 0.25,
                        value = 0.0),
            tags$div(
                    tags$p("In this Galton Box emulator you can choose:"),
                    tags$ol(
                            tags$li("Number of balls/beans that pass through pins"),
                            tags$li("Number of bins in which the ball can drop at the end of course"),
                            tags$li("Number of layers of pins through which ball can pass"),
                            tags$li("A coefficient to simulate the effect of pins not perfectly rounded")
                    )
            )
  ),
  
    # Show a plot of the generated distribution
    mainPanel(
        plotOutput("distributionPlot"),
        withMathJax(),
        tags$div(
                HTML(paste("<h4>Instruction</h4>",
                           "<p>Plays with the various controls to change the parameters of the machine",
                           "and see how the distribution of balls are changed.", 
                           "Some combinations of parameters <em>move simulation away from the ideal situation</em> for", 
                           "the central limit theorem and cause different distributions.</p>"
                           
                        )
                ),
                HTML(paste("<h4>Theory of the game</h4>",
                           "<p>A Galton Box",
                           "<a href='https://en.wikipedia.org/wiki/Bean_machine'>see Wikipedia</a>",
                           "is a device is a device invented by Sir Francis Galton to demonstrate the central limit theorem",
                           "<br>",
                           "The machine consists of a vertical board with interleaved rows of pins.",
                           "Balls are dropped from the top, and bounce either left or right as they hit the pins.",
                           "If a ball bounces to the right k times on its way down (and to the left on the remaining pins)", 
                           "it ends up in the <em>kth</em> bin counting from the left.",
                           "Denoting the number of rows of pins in a bean machine by <em>n</em>,",
                           "the number of paths to the kth bin on the bottom is given by the binomial coefficient",
                           "$${\\displaystyle {n \\choose k}}$$",
                           "If the probability of bouncing right on a pin is p (which equals 0.5 on an unbiased machine)", 
                           "the probability that the ball ends up in the kth bin equals",
                           "$${\\displaystyle {n \\choose k}p^{k}(1-p)^{n-k}}$$.",
                           " This is the probability mass function of a binomial distribution.<br>",
                           "In this apps the simulation is <b>very simplified</b> and it turns out that if the <em>number of layers is odd,", 
                           "bin odd are not reached and vice versa</em>.</p>"
                           )
                     )
                
        )
        
    )
  )
))
