require(shiny)
require(ygdashboard)

setwd("d:/guang/packages/ygdashboard/app/")

# runApp(appDir = getwd())

runApp(appDir = getwd(), launch.browser = TRUE)

runApp(appDir = getwd(), display.mode = "showcase")

runApp(port = 8572, appDir = getwd(), launch.browser = TRUE)
