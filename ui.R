shinyUI(pageWithSidebar(  
  headerPanel("Normal plot parameters"),  
  sidebarPanel(
    numericInput("mu", "Population mean", 5),
    numericInput("sigma", "Population standar deviation", 2),
    numericInput("number", "sample size for plotting", 1000),
    actionButton("normal", "Generate Data"),
    sliderInput('percentage', 'Percentage of sample',value = 1, 
                min = 0, max = 100, step = 1)
     ),
  mainPanel(
    h4('Instructions:'),
    h6('1. Set values in mean and standar deviation to generate normal numbers'),
    h6('2. Set the number of normal number to generate'),
    h6('3. Push the GENERATE button to show the plot'),
    h6('4. Select the percentage of data to obtain the mean and standar deviation'),
    h4('The result:'),
    h6('- The red line shows the sample mean. The yellow shows the population mean'),
    h6('- The bigger the sample, more the sample mean approaches to the population mean'),
    plotOutput('newHist')  
  )
))
