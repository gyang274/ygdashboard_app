# server.R

shinyServer(function(input, output, session) {
  
  #- create userInfo dynamically responsive to URL input 
  #- .../?user=<username>[&status=<online|away|offline>]
  
  #- create dashboardUser() and sidebarUserPanel()
  create_userInfo <- reactive({
    
    query <- parseQueryString(session$clientData$url_search)
    
    # parse URL for status
    user_status <- "Online"
    
    if ( "status" %in% names(query) ) {
      
      if (query[["status"]] == "away") {
        
        user_status = "Away"
        
      } else if (query[["status"]] == "offline") {
        
        user_status = "Offline"
        
      }
      
    }
    
    # set default userInfo
    head_user <- dashboardUser(
      name = "Guang Yang",
      image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/yg.jpg"),
      description = "Alchemist",
      sub_description = "Member since Aug. 2015",
      stat1 = "100 Posts",
      stat2 = "2048 Followers",
      stat3 = "1024 Following",
      btn1 = "Profile",
      btn2 = "Sign Out"
    )
    
    side_user <- sidebarUserPanel(
      name = "Guang Yang", subtitle = "Hi!", status = user_status,
      image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/yg.jpg")
    )
    
    # parse URL for userInfo
    if ( "user" %in% names(query) ) {
      
      # message("login as user: ", query[["user"]], "\n")
      
      if (query[["user"]] == "yg") {
        
        head_user <- dashboardUser(
          name = "Guang Yang",
          image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/yg.jpg"),
          description = "Data Scientist",
          sub_description = "Member since Aug. 2015",
          stat1 = "10 Posts",
          stat2 = "10 Followers",
          stat3 = "10 Following"
        )
        
        side_user <- sidebarUserPanel(
          name = "Guang Yang", subtitle = "Hello!", status = user_status,
          image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/yg.jpg")
        )
        
      } else if (query[["user"]] == "em") {
        
        head_user <- dashboardUser(
          name = "Ex Machina", 
          image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/exmachina.jpg"),
          description = "A.I.",
          sub_description = "Member since Apr. 2015",
          stat1 = "100 Posts",
          stat2 = "1024 Followers",
          stat3 = "8 Following"
        )
        
        side_user <- sidebarUserPanel(
          name = "Ex Machina", subtitle = "Hello World!", status = user_status,
          image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/exmachina.jpg")
        )
        
      } else if (query[["user"]] == "we") {
        
        head_user <- dashboardUser(
          name = "Wall E", 
          image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/walle.jpg"),
          description = "A.I.",
          sub_description = "Member since Aug. 2008",
          stat1 = "100 Posts",
          stat2 = "1024 Followers",
          stat3 = "8 Following"
        )
        
        side_user <- sidebarUserPanel(
          name = "Wall E", subtitle = "Hi, You!", status = user_status,
          image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/walle.jpg")
        )
        
      } else if (query[["user"]] == "dc") {
          
          head_user <- dashboardUser(
            name = "Dr. D.C.", 
            image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/dc.jpg"),
            description = "Architect",
            sub_description = "Member since Jul. 2002",
            stat1 = "100 Posts",
            stat2 = "1024 Followers",
            stat3 = "8 Following"
          )
          
          side_user <- sidebarUserPanel(
            name = "Dr. D.C.", subtitle = "Hi, You!", status = user_status,
            image = paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/dc.jpg")
          )
      }
      
    }
    
    return( list(head_user = head_user, side_user = side_user) )
    
  })
  
  output$user <- renderUser({ create_userInfo() %$% head_user })
  
  output$dynamicSidebarUserPanel <- renderMenu({ create_userInfo() %$% side_user })
  
  
  #- create siderbarMenu menuSegment dynamically on the server side
  output$dynamicSidebarLabel <- renderMenu({ menuSegment(text="LABELS") })
  
  
  #- create carouselActiveItem reponses to carousel slide
  output$carouselActiveItem <- renderText({ paste0("You're at Carousel #", input$carouselExample) })
  
  
  #- create chatMessage responses to user text input and button hit
  create_dynamicChatMessage <- eventReactive(input$chatBtn, {
    
    # we would need a global allChatMessage to keep history of chat
    
    # set default
    user_name <- "Ex Machina"
    user_image <- paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/exmachina.jpg")
    message_pos <- "right"
    
    # parse user
    query <- parseQueryString(session$clientData$url_search)
  
    # we should create a database of user_name -> userInfo mapping..
    if ( "user" %in% names(query) ) { 
      
      if (query[["user"]] == "yg") {
        
        user_name <- "Guang Yang"
        user_image <- paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/yg.jpg")
        message_pos <- "left"
        
      } else if (query[["user"]] == "em") {
        
        user_name <- "Ex Machina"
        user_image <- paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/exmachina.jpg")
        message_pos <- "right"
        
      } else if (query[["user"]] == "we") {
        
        user_name <- "Wall E"
        user_image <- paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/walle.jpg")
        message_pos <- "right"
        
      } else if (query[["user"]] == "dc") {
        
        user_name <- "Dr. D.C."
        user_image <- paste0("ygdashboard", "-", as.character(utils::packageVersion("ygdashboard")), "/img/dc.jpg")
        message_pos <- "right"

      }
      
    }
    
    # use <<- to update allChatMessage in .GlobalEnv and show accumlated message..
    
    # allChatMessage <<- append(
    #   allChatMessage, 
    #   list(
    #     chatMessage(
    #       name = user_name,
    #       image = user_image,
    #       text = input$chatText, 
    #       position = message_pos, 
    #       timestamp = Sys.time()
    #     )
    #   )
    # )
    # 
    # updateTextInput(session, inputId = "chatText", label = "Type Message ...", value = NULL)
    
    allChatMessage <- list(
      chatMessage(
        name = user_name,
        image = user_image,
        text = input$chatText,
        position = message_pos,
        timestamp = Sys.time()
      )
    )
    
    return(allChatMessage)
    
  })
  
  output$dynamicChatMessage <- renderChatMessage({ create_dynamicChatMessage() })
  
  
  #- create text response to user search (hit enter or click with JS)
  create_dbSearchRtn <- eventReactive(input$dbSearchBtn, {
    
    return(p("The user is searching for ", strong(input$dbSearchTrm), " ...\n"))
    
  })
  
  output$dbSearchRtn <- renderUI(create_dbSearchRtn())
  
  
  #- create leaflet a map responses to user input and selections on map control panel
  ## TODO: implement control panel with style.css and gomap.js inherited from skm/app
  create_dynamicLeaflet <- reactive({
    
    map <- leaflet(data = mapStates) %>% 
      addProviderTiles(
        "Stamen.TonerLite", 
        options = providerTileOptions(noWrap = TRUE)) %>%
      addPolygons(
        fillColor = topo.colors(10, alpha = NULL), stroke = FALSE
      )
    
    return( map )
    
  })
  
  output$dynamicLeaflet <- renderLeaflet({ create_dynamicLeaflet() })
  
  
  #- create footer as running message commnunication
  output$dynamicFooter <- renderFooter({ dashboardFooter(subText = HTML("<b>Version</b> 2.3.5")) })
  
  
})
