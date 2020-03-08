library(shiny)
shinyUI(navbarPage("Optimizing Common Utility Functions",
   tabPanel("Cobb Douglas",
            h4("We'll use a Cobb Douglas utility function of the form:"), 
            h3(withMathJax('$$U(X, Y) = X ^ \\alpha Y ^ {1 - \\alpha}$$')), 
            h4(withMathJax("Where $$0 < \\alpha < 1$$")),
            h4("Go ahead and change the alpha parameter, as well as the prices 
               and income to see how the optimal consumption basket changes"),
            sidebarPanel(
                sliderInput("cd_alpha", "Select the value of alpha", value = 1/2, 
                            min = 0.01, max = 0.99, step = .01), 
                sliderInput("cd_Income", "Select Value of Income", value = 100, 
                            min = 50, max = 200, step = 1), 
                sliderInput("cd_Px", "Select Price of X", value = 1, 
                            min = .5, max = 10, step = .01), 
                sliderInput("cd_Py", "Select Price of Y", value = 1, 
                            min = .5, max = 10, step = .01)
            ),
            mainPanel(
                h3("Plot of optimal consumption basket"), 
                plotOutput("CobbDouglas")
            )
   ),
   tabPanel("Quasilinear",
            h4("We'll use a quasilinear utility function of the form:"), 
            h3(withMathJax('$$U(X, Y) = X  + 12Y^ \\alpha$$')),  
            h4(withMathJax("Where $$0 < \\alpha < 1$$")), 
            h4("Go ahead and change the prices, income or alpha parameter 
               to see how the optimal consumption basket changes"),  
            sidebarPanel(
                sliderInput("ql_alpha", "Select the value of alpha", value = 1/2, 
                            min = 0.01, max = 0.99, step = .01), 
                sliderInput("ql_Income", "Select Value of Income", value = 100, 
                            min = 50, max = 200, step = 1), 
                sliderInput("ql_Px", "Select Price of X", value = 1, 
                            min = .5, max = 10, step = .01), 
                sliderInput("ql_Py", "Select Price of Y", value = 1, 
                            min = .5, max = 10, step = .01)
            ),
            mainPanel(
                h3("Plot of optimal consumption basket"), 
                plotOutput("Quasilinear")
            )
   ), 
   tabPanel("CES", 
            h4("We'll use a Constant Elasticity of Substitution (CES) utility function of the form:"), 
            h3(withMathJax('$$U(X,Y) = \\alpha X ^ {-\\rho} + (1-\\alpha)Y ^ {-\\rho}$$')), 
            h4(withMathJax("when $$\\rho < [-1, 0) \\cap (0, \\infty)$$")), 
            h4("Go ahead and change the alpha parameter, as well as the prices 
               and income to see how the optimal consumption basket changes. 
               You can also change the rho parameter, and see how the curve looks 
               like a perfect substitute when rho equals one, like a cobb douglas as 
               rho approaches zero, or a perfect compliments curve as rho increases
               to 100."), 
            sidebarPanel(
               sliderInput("ces_alpha", "Select the value of alpha", value = 1/2, 
                           min = 0.01, max = 0.99, step = .01), 
               selectInput("ces_rho", "Select the value of rho",
                           choices = list(-1, -.9, -.85, -.80, -.75, -.5, -.25, -.1, -.01, 
                                          .01, .1, .25, .5, .75, 1, 1.25, 1.5, 1.75, 2, 5, 10, 100)), 
               sliderInput("ces_Income", "Select Value of Income", value = 100, 
                           min = 50, max = 200, step = 1), 
               sliderInput("ces_Px", "Select Price of X", value = 1, 
                           min = .5, max = 10, step = .01), 
               sliderInput("ces_Py", "Select Price of Y", value = 1, 
                           min = .5, max = 10, step = .01)
            ),
            mainPanel(
               h3("Plot of optimal consumption basket"), 
               plotOutput("CES")
            )
            )
))