# ui.R

ui <- dashboardPage(
  
  skin = "purple", title = "YG",
  
  #- header
  dashboardHeader(
    
    title = HTML('<b>YG</b> Dashboard'), titleWidth = 300, 
    
    user = userOutput("user"), # user = dashboardUser(),
    
    dropdownMenu(
      type = "messages",
      messageItem(
        from = "Administrator",
        message = "Welcome!"
      ),
      messageItem(
        from = "New User",
        message = "How do I register?",
        icon = icon("question"),
        time = "23:42"
      ),
      messageItem(
        from = "Support",
        message = "The new alchemist is in.",
        icon = icon("book"),
        time = "2015-08-31"
      )
    ),
    
    dropdownMenu(
      type = "notifications",
      notificationItem(
       text = "5 new users today",
       icon("users")
      ),
      notificationItem(
       text = "12 items delivered",
       icon("truck"),
       status = "success"
      ),
      notificationItem(
       text = "Server load at 86%",
       icon = icon("exclamation-triangle"),
       status = "warning"
      )
    ),
    
    dropdownMenu(
      
      type = "tasks", badgeStatus = "success",
      
      taskItem(
        value = 99, color = "green", text = "Project X"
      ),
      taskItem(
        value = 17, color = "red", text = "Server Deployment"
      ),
      taskItem(
        value = 74, color = "yellow", text = "Documentation"
      ),
      taskItem(
        value = 85, color = "aqua", text = "Overall project"
      )
    )
    
  ),
  
  #- sidebar
  dashboardSidebar(
    
    width = 300,
    
    sidebarUserPanelOutput(outputId = "dynamicSidebarUserPanel"),
    
    sidebarMenu(
      
      id = "sidebar_main",
      
      menuSegment("MAIN NAVIGATION"),
          
      menuItem("Dashboard", tabName = "dh", icon = icon("dashboard")), 
      
      menuItem("Chat", tabName = "chat", icon = icon("comments"), badgeLabel = "new", badgeColor = "yellow"),
      
      menuItem("Calendar", tabName = "clnd", icon = icon("calendar")),
      
      menuItem("Carousel", tabName = "krsl", icon = icon("spinner")),
      
      menuItem("Database", tabName = "db", icon = icon("database")), 
      
      conditionalPanel(
        "input.sidebar_main == 'db'",
        sidebarSearchForm(textId = "dbSearchTrm", buttonId = "dbSearchBtn", label = "Search in Database (Hit Enter as Click Magnifier Button)...")
      ),
      
      menuItem("Table", tabName = "tbl", icon = icon("table")), 
      
      menuItem("Figure", tabName = "fig", icon = icon("th")),
      
      menuItem("Map", tabName = "map", icon = icon("map")),
      
      menuItem("Timeline", tabName = "log", icon = icon("bars"), badgeLabel = "new", badgeColor = "green"),
      
      menuItem("Documentation", tabName = "doc", icon = icon("book"), selected = TRUE) #, href = "https://github.com/gyang274/ygdashboard/")
      
    ),
      
    sidebarMenu(
      
      id = "sidebar_label",
      
      menuSegmentOutput(outputId = "dynamicSidebarLabel"),
                
      menuItem("Important", icon = icon("circle-o text-red")),
      menuItem("Warning", icon = icon("circle-o text-yellow")),
      menuItem("Information", icon = icon("circle-o text-aqua"))
      
    )
    
  ),
  
  #- body
  dashboardBody(
    
    # custom css and js
    tags$head(tags$script(src="js/enter_as_click.js")),
    
    # add tab w.r.t menu
    tabItems(
      
      tabItem(
        
        tabName = "dh",
        
        h2("Dashboard Tab Content"),
        
        fluidRow(
          
          infoBox(title = "infoBox Type1", value = 22, subtitle = "ok!", icon = icon("download"), color = "aqua"),
          
          infoBox(title = "infoBox Type2", value = 23, icon = icon("cloud-download"), color = "green", fill = TRUE),
          
          infoBox(title = "infoBox Type2 Plus", value = 42, icon = icon("thumbs-o-up"), color = "purple",
                  fill = TRUE, prog = "New in YG Dashboard - Progress: 98% complete!", prog.width = "98%")
          
        ),
        
        fluidRow(

          # A static valueBox
          valueBox(value = 22, subtitle = "valueBox Type1", icon = icon("link"), color = "aqua", width = 4),
          
          valueBox(value = 23, subtitle = "valueBox Type1", icon = icon("credit-card"), color = "green", width = 4),
          
          valueBox(value = 42, subtitle = "valueBox Type1", icon = icon("thumbs-o-up"), color = "purple", width = 4)
          
        )

      ),
      
      tabItem(
        
        tabName = "chat",
        
        chatBox(
          title = "Direct Chat Box", textInputId = "chatText", btnInputId = "chatBtn",
          solidHeader = TRUE, background = NULL, width = 12, newMessage = 10,
          contactList = chatContactList(
            chatContact(
              name = "Ex Machina",
              image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/exmachina.jpg"),
              date = "05-26-2009",
              text = "Hello World!"
            ),
            chatContact(
              name = "Wall E",
              image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/walle.jpg"),
              date = "08-26-2000",
              text = "Here, Here!"
            ),
            chatContact(
              name = "Dr. D.C.",
              image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/dc.jpg"),
              date = "09-26-1990",
              text = "May the 4th be with you."
            )
          ),
          chatMessage(
            name = "Guang Yang", 
            image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/yg.jpg"),
            text = "Welcome!", 
            position = "left", 
            timestamp = "07-02-2016"
          ),
          chatMessage(
            name = "Ex Machina", 
            image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/exmachina.jpg"),
            text = "Hi, YG! Thank you and the RStudio team for the excellent dashboard template!",
            position = "right", 
            timestamp = "07-02-2016"
          ),
          chatMessageOutput("dynamicChatMessage")
        )
        
      ),
      
      tabItem(
        
        tabName = "clnd",
        
        h2("Calendar with Tasks Tracker"),
        
        # TODO: check why not work? ...
        calendarBox(title = "My Calendar")
        
      ),
      
      tabItem(
        
        tabName = "krsl",
        
        h2("Carousel Slide Show"),
        
        carouselBox(
          
          title = "Carousel Box", footer = "Carousel Box Footer", status = "success", 
          solidHeader = TRUE, background = NULL, width = 12L, # height = 400L,
          collapsible = TRUE, collapsed = FALSE,
          
          carouselSets(
            
            id = "carousel-example",
            
            carouselItem(
              
              tags$img(src = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/exmachina.jpg"), style="width:100%; height:auto;"), 
              
              caption = "Ex Machina"
              
            ),
            
            carouselItem(
              
              tags$img(src = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/walle.jpg"), style="width:100%; height:auto;"), 
              
              caption = "Wall E"
              
            ),
            
            carouselItem(
              
              tags$img(src = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/dc.jpg"), style="width:100%; height:auto;"), 
              
              caption = "Dr. D.C."
              
            )
            
          )
          
        )
        
      ),
      
      tabItem(
        
        tabName = "db",
              
        h2("Database Tab Content"),
        
        box(
          title = "Database Search Box - Title", footer = "Database Search Box - Footer", status = "success", 
          solidHeader = TRUE, background = NULL, width = 6, # height = 400,
          collapsible = TRUE, collapsed = FALSE,
          uiOutput("dbSearchRtn")
        )
        
      ),
      
      tabItem(
        
        tabName = "tbl",
        
        h2("Table - Widgets Tab Content")
        
      ),
      
      tabItem(
        
        tabName = "fig",
        
        h2("Figure - Map Tab Content"),
        
        fluidRow(
          
          box(
            title = "Plot Title", footer = "Plot Footer", status = "success", 
            solidHeader = TRUE, background = NULL, width = 6, height = 400,
            collapsible = TRUE, collapsed = FALSE,
            plotOutput("plot1", height = 400)
          ),
          
          box(
            title = "Inputs", footer = NULL, status = "warning", 
            solidHeader = TRUE, background = NULL, width = 6, height = 400, 
            collapsible = TRUE, collapsed = FALSE,
            "Box content here", br(), "More box content",
            sliderInput("slider", "Slider input:", 1, 100, 50),
            textInput("text", "Text input:")
          )
          
        )
         
      ),
      
      tabItem(
        
        tabName = "map",
        
        box(
          
          title = "Map Box - Title", footer = "Map Box - Footer", status = "success", 
          solidHeader = TRUE, background = NULL, width = 12, # height = 400,
          collapsible = TRUE, collapsed = FALSE,
          
          leafletOutput(outputId = "dynamicLeaflet")
          
        )
        
      ),
      
      tabItem(
        
        tabName = "log",
        
        box(
          
          title = "Timeline Box - Title", footer = NULL, status = "success", 
          solidHeader = TRUE, background = NULL, width = 12, # height = 400,
          collapsible = TRUE, collapsed = FALSE,
          
          timelineBox(
            
            timelineLabel(
              text = HTML("<b>&nbsp;2016-07-02&nbsp;</b>"), color = "purple"
            ),
            
            timelineItem(
              icon = shiny::icon("github bg-purple"),
              header = HTML('<strong><a href="#">Guang Yang</strong>'), 
              body = "Git push ygdashboard and ygdashboard/app.", 
              footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                            '<a class="btn btn-danger btn-xs">Delete</a>'), 
              itemText = "2016-07-02 05:14:22"
            ),
            
            timelineLabel(
              text = HTML("<b>&nbsp;2016-06-26&nbsp;</b>"), color = "red"
            ),
            
            timelineItem(
              icon = shiny::icon("code bg-red"),
              header = HTML('<strong><a href="#">Guang Yang</strong>'), 
              body = "Fix sidebarUserPanel background conflict with leaflet in ygdashboard (shinydashboard).", 
              footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                            '<a class="btn btn-danger btn-xs">Delete</a>'), 
              itemText = "2016-06-26 23:22:48"
            ),
            
            timelineItem(
              icon = shiny::icon("file-text bg-red"),
              header = HTML('<strong><a href="#">Guang Yang</strong>'), 
              body = "Add Map Tabl on ygdashboard/app.", 
              footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                            '<a class="btn btn-danger btn-xs">Delete</a>'), 
              itemText = "2016-06-26 23:22:48"
            ),
            
            timelineItem(
              icon = shiny::icon("file-text bg-red"),
              header = HTML('<strong><a href="#">Guang Yang</strong>'), 
              body = "Add chatBox Tabl and timelineBox Tab on ygdashboard/app.", 
              footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                            '<a class="btn btn-danger btn-xs">Delete</a>'), 
              itemText = "2016-06-26 22:34:58"
            ),
            
            timelineItem(
              icon = shiny::icon("code bg-red"),
              header = HTML('<strong><a href="#">Guang Yang</strong>'), 
              body = "Add chatBox and timelineBox in ygdashboard.", 
              footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                            '<a class="btn btn-danger btn-xs">Delete</a>'), 
              itemText = "2016-06-26 14:23:46"
            ),
            
            timelineItem(
              icon = shiny::icon("envelope bg-red"),
              header = HTML('<strong><a href="#">Ex Machina</strong>'), 
              body = "Request on adding chatBox - I would like to chat!", 
              footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                            '<a class="btn btn-danger btn-xs">Delete</a>'),
              itemText = "2016-06-23 17:22:54"
            ),
            
            timelineLabel(
              text = HTML("<b>&nbsp;2016-06-22&nbsp;</b>"), color = "yellow"),
            
            timelineItem(
              icon = shiny::icon("file-text bg-yellow"),
              header = HTML('<strong><a href="#">Guang Yang</strong>'), 
              body = "Create a template dashboard using ygdashboard in ygdashboard/app", 
              footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                            '<a class="btn btn-danger btn-xs">Delete</a>'), 
              itemText = "2016-06-22 05:22:14"
            ),
            
            timelineItem(
              icon = shiny::icon("code bg-yellow"),
              header = HTML('<strong><a href="#">Guang Yang</strong>'), 
              body = "Add dashboardUser, dashboardFooter and dashboardControlbar in ygdashboard.", 
              footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                            '<a class="btn btn-danger btn-xs">Delete</a>'), 
              itemText = "2016-06-22 14:23:46"
            ),
            
            timelineItem(
              icon = shiny::icon("cloud bg-yellow"),
              header = HTML('<strong><a href="#">Guang Yang</strong>'), 
              body = "Request on an user info panel on header.", 
              footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                            '<a class="btn btn-danger btn-xs">Delete</a>'),
              itemText = "2016-06-22 04:22:54"
            ),
            
            timelineLabel(
              text = HTML("<b>&nbsp;2016-06-16&nbsp;</b>"), color = "green"
            ),
            
            timelineItem(
              icon = shiny::icon("code bg-green"),
              header = HTML('<strong><a href="#">Guang Yang</strong>'), 
              body = "Create ygdashboard with modifying shinydashboard source code so that a collapse sidebar showing menuItem icons when collapsed.", 
              footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                            '<a class="btn btn-danger btn-xs">Delete</a>'), 
              itemText = "2016-06-16 17:23:46"
            ),
            
            timelineItem(
              icon = shiny::icon("cloud bg-green"),
              header = HTML('<strong><a href="#">Guang Yang</strong>'), 
              body = "Request on a collapse sidebar showing menuItem icons when collapsed.", 
              footer = HTML('<a class="btn btn-primary btn-xs">Read more</a>',
                            '<a class="btn btn-danger btn-xs">Delete</a>'),
              itemText = "2016-06-16 14:22:54"
            )
            
          )
          
        )
        
      ),
      
      tabItem(
        
        tabName = "doc",
        
        includeMarkdown("README.md")
      )
      
    )
    
  ),
  #- ydob
  
  #- footer
  footerOutput(outputId = "dynamicFooter"),
  
  #- controlbar
  dashboardControlbar()
  
)
