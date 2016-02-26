library(UsingR)

shinyServer(  
  function(input, output) {
    normalNumbers <- eventReactive(input$normal, {
      rnorm(input$number, input$mu, input$sigma)
    })
    
    output$newHist <- renderPlot({
      nNumbers <- normalNumbers()
      hist(nNumbers, xlab='data', col='lightblue',main='Normal Data Histogram')      
      percentage <- input$percentage
      samp <- sample(nNumbers, round(percentage*input$number/100))
      xBar <- mean(samp)
      s <- sd(samp)
      minDataX <- min(nNumbers)+1
      maxDataY <- input$number*.19
      lines(c(input$mu, input$mu), c(0, 2000),col="yellow",lwd=5)
      lines(c(xBar, xBar), c(0, 2000),col="red",lwd=5)   
      text(minDataX, maxDataY, paste("xBar = ", round(xBar,2)))
      text(minDataX, maxDataY*0.95, paste("s = ", round(s,2)))
    })      }
)
