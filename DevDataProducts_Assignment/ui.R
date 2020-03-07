library(shiny)
shinyUI(navbarPage("Optimizing Common Utility Functions",
   tabPanel("Cobb Douglas",
            h4("We'll use a Cobb Douglas utility function of the form:"), 
            h3(withMathJax('$$U(X, Y) = X ^ \\alpha Y ^ {1 - \\alpha}$$')), 
            h4(withMathJax("Where $$0 < \\alpha < 1$$")), 
            sidebarPanel(
                sliderInput("cd_alpha", "Select the value of alpha", value = 1/2, 
                            min = 0.1, max = 0.9, step = .1), 
                sliderInput("cd_Income", "Select Value of Income", value = 100, 
                            min = 50, max = 200, step = 1), 
                sliderInput("cd_Px", "Select Price of X", value = 1, 
                            min = .5, max = 10, step = .5), 
                sliderInput("cd_Py", "Select Price of Y", value = 1, 
                            min = .5, max = 10, step = .5)
            ),
            mainPanel(
                h3("Plot of optimal consumption basket"), 
                plotOutput("CobbDouglas")
            )
   ),
   tabPanel("Quasilinear",
            h4("We'll use a quasilinear utility function of the form:"), 
            h3(withMathJax('$$U(X, Y) = X ^ \\alpha + 12Y$$')),  
            h4(withMathJax("Where $$0 < \\alpha < 1$$")), 
            h4("The 400 is just a scalar so the graph looks better"),  
            sidebarPanel(
                sliderInput("ql_alpha", "Select the value of alpha", value = 1/2, 
                            min = 0.1, max = 0.9, step = .1), 
                sliderInput("ql_Income", "Select Value of Income", value = 100, 
                            min = 50, max = 200, step = 1), 
                sliderInput("ql_Px", "Select Price of X", value = 1, 
                            min = .5, max = 10, step = .5), 
                sliderInput("ql_Py", "Select Price of Y", value = 1, 
                            min = .5, max = 10, step = .5)
            ),
            mainPanel(
                h3("Plot of optimal consumption basket"), 
                plotOutput("Quasilinear")
            )
   ), 
   tabPanel("CES", 
            h4("We'll use a Constant Elasticity of Substitution (CES) utility function of the form:"), 
            h3(withMathJax('$$U(X,Y) = [\\alpha X ^ {-\\rho} + (1-\\alpha)Y ^ {-\\rho}] ^ {- \\frac{1}{\\rho}}$$')), 
            h4(withMathJax("Where $$0 < \\alpha < 1$$")), 
            h4(withMathJax("and $$\\rho \\in [-1, 0) \\cap (0, \\infty)$$")), 
            sidebarPanel(
               sliderInput("ces_alpha", "Select the value of alpha", value = 1/2, 
                           min = 0.1, max = 0.9, step = .1), 
               selectInput("ces_rho", "Select the value of rho", 
                           choices = list(-1, -.75, -.5, -.25, .25, .5, .75, 
                                          1, 2, 5, 10, 20, 50, 100, 200, 500)), 
               sliderInput("ces_Income", "Select Value of Income", value = 100, 
                           min = 50, max = 200, step = 1), 
               sliderInput("ces_Px", "Select Price of X", value = 1, 
                           min = .5, max = 10, step = .5), 
               sliderInput("ces_Py", "Select Price of Y", value = 1, 
                           min = .5, max = 10, step = .5)
            ),
            mainPanel(
               h3("Plot of optimal consumption basket"), 
               plotOutput("Quasilinear")
            )
            )
))