library(shiny)
      
shinyUI(navbarPage(title = "Navigation Bar",
        tabPanel(title = "DOCUMENTATION",
        h3("Title: Prediction on Car Fuel Efficiency"),
        br(),
        h4("This shiny application allows you to enter you car specs
           and make a prediction of the fuel efficiency of you car."),
        h4("You will need to enter the following car specs:"),
        br(),
        h4("1) Number of Cyclinder"),
        h4("2) Horse Power"),
        h4("3) Car Weight (1000 lbs)"),
        h4("4) Transmission Type"),
        br(),
        h4("After all the required car specs are entered, click on the SUBMIT button."),
        h4("The shiny app will calculate and display the average fuel efficiency
           (in terms of MPG - Miles Per Gallon) of your car."),
        h4("Note that if you enter an invalid car spec, the apps will not calulate
           the fuel efficiency of your car."),
        br(),
        h4("Click on the PREDICT navigation tab at the top to go to the Fuel Efficiency
           prediction page")       
        ),     
                   
                   
        tabPanel(title = "PREDICT",
                sidebarLayout(
                        sidebarPanel(
                                h3("This application will predict the fuel efficiency of your
                                car in MPG (miles per gallon)"),
                                br(),
                                h4("Enter Your Car Specs in the following format:"),
                                
                                # Get the number of Cylinder
                                numericInput(inputId = "cyl",
                                             label = c("Number of Cyclinder (even number): ",
                                                       min(mtcars$cyl), " to ", max(mtcars$cyl)),
                                             value = min(mtcars$cyl),
                                             min = min(mtcars$cyl),
                                             max = max(mtcars$cyl),
                                             step = 2),
                                
                                # Get the horse power                
                                numericInput(inputId = "hp",
                                             label = c("Horse Power: ", min(mtcars$hp),
                                                       " to ", max(mtcars$hp)),
                                             value = min(mtcars$hp),
                                             min = min(mtcars$hp),
                                             max = max(mtcars$hp),
                                             step = 1),
                                
                                # Get the weight                
                                numericInput(inputId = "wt",
                                             label = c("Car Weight (1000 lbs): ", min(mtcars$wt),
                                                       " to ", max(mtcars$wt)),
                                             value = min(mtcars$wt),
                                             min = min(mtcars$wt),
                                             max = max(mtcars$wt),
                                             step = 1/1000),              
                                
                                # Get the transmission type (checked means Auto transmission)                
                                selectInput(inputId = "am",
                                            label = "Transmission Type",
                                            choices = c("Auto", "Manual"),
                                            selected = "Auto"),
                                
                                submitButton("Submit")
                        ),
                         
                        mainPanel(
                                h3("Your Car Specs Are:"),
                                br(),
                                h4("Number of Cylinder:"),
                                verbatimTextOutput("cyl"),
                                h4("Horse Power:"),                
                                verbatimTextOutput("hp"),
                                h4("Weight (1000 lbs):"),
                                verbatimTextOutput("wt"),
                                h4("Transmission Type:"),
                                verbatimTextOutput("am"),
                                br(),                
                                h4("Based on your car specs, the average fuel efficiency (MPG) will
                                   be:"),                
                                verbatimTextOutput("mpg_avg")
                        )
                )
                )
)
)

