library(shiny)

shinyServer(function(input, output) {
    output$CobbDouglas <- renderPlot({
        cd_x <- 1:200
        cd_px <- input$cd_Px
        cd_py <- input$cd_Py
        cd_I <- input$cd_Income
        cd_alpha <- input$cd_alpha
        cd_BC <- cd_I / cd_py - cd_px / cd_py * cd_x
        cd_Y <- ((1 / (cd_x ^ cd_alpha)) * ((cd_alpha * cd_I / cd_px) ^ cd_alpha) * 
                     (((1 - cd_alpha) * cd_I / cd_py) ^ (1 - cd_alpha))) ^ (1 / (1 - cd_alpha))
        cd_x_op <- cd_alpha * cd_I / cd_px
        cd_y_op <- (1 - cd_alpha) * cd_I / cd_py
        cd_x_leg <- as.character(round(cd_x_op, 2))
        cd_y_leg <- as.character(round(cd_y_op, 2))
        cd_for_legend <- paste("X = ", cd_x_leg, ", Y = ", cd_y_leg)
        cd_x_leg_pos <- if(cd_x_op > 150){cd_x_op - 25} else {cd_x_op + 25}
        cd_y_leg_pos <- if(cd_y_op > 150){cd_y_op - 25} else {cd_y_op + 25}
        
        plot(cd_x, cd_BC, xlab = "X", type = "l", ylab = "Y", main = "Cobb Douglas optimization", 
             xlim = c(0, 200), ylim = c(0, 200), col = "red", lwd = 2)
        lines(cd_x, cd_Y, type = "l", col = "blue", lwd = 2)
        points(cd_x_op, cd_y_op, pch = 19, cex = 2)
        lines(x = c(0, cd_x_op), y = c(cd_y_op, cd_y_op), lty = 3)
        lines(x = c(cd_x_op, cd_x_op), y = c(0, cd_y_op), lty = 3)
        text(cd_x_leg_pos, cd_y_leg_pos, label = cd_for_legend)
    })
    
    output$Quasilinear <- renderPlot({
        ql_x <- 1:200
        ql_px <- input$ql_Px
        ql_py <- input$ql_Py
        ql_I <- input$ql_Income
        ql_alpha <- input$ql_alpha
        ql_BC <- (ql_I / ql_py) - (ql_x * ql_px / ql_py)
        ql_y_aux <- (ql_alpha * 12 * ql_px / ql_py) ^ (1 / (1 - ql_alpha))
        
        if(ql_I - ql_py * ql_y_aux < 0 ){
            ql_x_op <- 0
            ql_y_op <- ql_I / ql_py
        } else {
            ql_y_op <- ql_y_aux  
            ql_x_op <- (ql_I - ql_py * ql_y_op) / ql_px
        }
        
        ql_ut <- ql_x_op + 12 * ql_y_op ^ ql_alpha

        ql_Y <- ((ql_ut - ql_x) / 12) ^ (1 / ql_alpha)

        ql_x_leg <- as.character(round(ql_x_op, 2))
        ql_y_leg <- as.character(round(ql_y_op, 2))
        ql_for_legend <- paste("X = ", ql_x_leg, ", Y = ", ql_y_leg)
        ql_x_leg_pos <- if(ql_x_op > 150){ql_x_op - 25} else {ql_x_op + 25}
        ql_y_leg_pos <- if(ql_y_op > 150){ql_y_op - 25} else {ql_y_op + 25}
        plot(ql_x, ql_BC, xlab = "X", type = "l", ylab = "Y", main = "Cobb Douglas optimization", 
             xlim = c(0, 200), ylim = c(0, 200), col = "red", lwd = 2)
        lines(ql_x[0:ql_ut], ql_Y[0:ql_ut], type = "l", col = "blue", lwd = 2)
        points(ql_x_op, ql_y_op, pch = 19, cex = 2)
        lines(x = c(0, ql_x_op), y = c(ql_y_op, ql_y_op), lty = 3)
        lines(x = c(ql_x_op, ql_x_op), y = c(0, ql_y_op), lty = 3)
        text(ql_x_leg_pos, ql_y_leg_pos, label = ql_for_legend)
    })
    
    output$CES <- renderPlot({
        ces_x <- 1:200
        ces_y <- 1:200
        ces_px <- input$ces_Px
        ces_py <- input$ces_Py
        ces_I <- input$ces_Income
        ces_alpha <- input$ces_alpha
        ces_rho <- as.numeric(input$ces_rho)
        ces_BC <- (ces_I / ces_py) - (ces_x * ces_px / ces_py)
        
        ces_x_op <- ces_I * 
            (ces_px + 
                 (ces_py * (((1 - ces_alpha) / ces_alpha) * (ces_px / ces_py)) ^ (1 / (1 + ces_rho)))) ^ (-1)
        
        ces_y_op <- ces_I * 
            (ces_py + 
                 (ces_px * ((ces_alpha / (1 - ces_alpha)) * (ces_py / ces_px)) ^ (1 / (1 + ces_rho)))) ^ (-1)        
        
        
        ces_ut <- ces_alpha * ces_x_op ^ (-ces_rho) + 
            (1 - ces_alpha) * ces_y_op ^ (-ces_rho)
        ces_Y <- ((ces_ut - (ces_alpha * (ces_x ^ (-ces_rho)))) / (1 - ces_alpha)) ^ (-1 / ces_rho)
        ces_X <- ((ces_ut - ((1 - ces_alpha) * (ces_y ^ (-ces_rho)))) / ces_alpha) ^ (-1 / ces_rho)

        
        ces_x_leg <- as.character(round(ces_x_op, 2))
        ces_y_leg <- as.character(round(ces_y_op, 2))
        ces_for_legend <- paste("X = ", ces_x_leg, ", Y = ", ces_y_leg)
        ces_x_leg_pos <- if(ces_x_op > 150){ces_x_op - 25} else {ces_x_op + 25}
        ces_y_leg_pos <- if(ces_y_op > 150){ces_y_op - 25} else {ces_y_op + 25}
        
        plot(ces_x, ces_BC, xlab = "X", type = "l", ylab = "Y", main = "CES optimization", 
             xlim = c(0, 200), ylim = c(0, 200), col = "red", lwd = 2)
        lines(ces_x, ces_Y, type = "l", col = "blue", lwd = 2)
        lines(ces_X, ces_y, type = "l", col = "blue", lwd = 2)
        points(ces_x_op, ces_y_op, pch = 19, cex = 2)
        lines(x = c(0, ces_x_op), y = c(ces_y_op, ces_y_op), lty = 3)
        lines(x = c(ces_x_op, ces_x_op), y = c(0, ces_y_op), lty = 3)
        text(ces_x_leg_pos, ces_y_leg_pos, label = ces_for_legend)
    })

    
})
