require(shiny)
require(ygdashboard)

setwd("d:/guang/packages/ygdashboard/app/")

# runApp(appDir = getwd(), port = 8572)

runApp(appDir = getwd(), port = 8572, launch.browser = TRUE)

runApp(appDir = getwd(), port = 8572, display.mode = "showcase")
