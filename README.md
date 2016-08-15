<!-- README.md is generated from README.Rmd. -->
ygdashboard
===========

A modified shinydashboard to incorporate more functionality from adminLTE.

Origination
-----------

I would like first express my sincere thanks to Winston Chang, the RStutio team, Almasaeed Studio and everyone involved in developing shiny and shinydashboard.

At first, I simply want have a sidebar that would still show menuItem icons when collapsed, so that me and other users can still switch between tabs without re-expanding the sidebar. I find this could only be completed (with my limited knowledge) by modifying shinydashboard source code. This is the begin I downloaded shinydashboard source code and started ygdashboard as a modified version.

Then, I fascinate on having a user info panel on the top right header, having a footer on the bottom of the body, having a menu segment on the side menu bar, having a right control panel with toggle on top right header. I implement the first three features, and leave the last one as a pure HTML holder - you still have it but via making a HTML input. This is the part I enjoyed the most seeing the capability of shinydashboard extending gradually.

At last, I would like to have versatile boxes, so I implements a calendar box, a chat box, and a timeline box. The calendar won't show up on shiny app page - I would happy if anyone knows the reason. The chat box is fun, as you would see in the show cases. The timeline box provides an excellent interface for logging, which I found as the most useful one. This is where the fun continues and I am start seeing ygdashboard showing some valuable extension on shinydashboard.

Along the way, I find that `leafletfix.css:8` in leaflet overrides shinydashboard css and makes the `sidebarUserPanel()` having grey box prominent from the black background - unconformable aesthetically - fix it by adding `style="background-color:transparent;"` in `div(class = "user-panel", ..., div(class = "pull-left info", ...))` in `sidebarUserPanel()`. I also find that font awesome icon like `envira` is not recognized in shiny - all 30 new icons in 4.6 won't? Please see full development log at [ygdashboard on github](https://github.com/gyang274/ygdashboard/).

Welcome to view this [ygdashboard app on shinyapps.io](https://gyang.shinyapps.io/ygdashboard/)!

Main Feature
------------

-   Overview

<img src="fig/overview.png" width="1920" />

-   New feature: show menu icons when sidebar collapse.

<img src="fig/collapse_sidebar.png" width="1920" />

-   New component:

    -   Add user info panel on top right header.

    -   Add footer on the bottom of the body.

    -   Add menu segments on the side menu bar.

    -   Add a right control panel with toggle on top right header.

        <img src="fig/user_info_panel.png" width="1920" />

        <img src="fig/control_panel.png" width="1920" />

    -   The user info panel can be created dynamically with userOutput() on client side and renderUser({ dashboardUser() }) on the server side. This allow login like feature, such as switching user info and possible UI design for different users at run time.

        <img src="fig/switch_user_01.png" width="1920" />

        <img src="fig/switch_user_02.png" width="1920" />

        <img src="fig/switch_user_03.png" width="1920" />

        <img src="fig/switch_user_04.png" width="1920" />

-   Dashboard Tab:

    -   Add a new infoBox() with progress bar.

<img src="fig/dashboard.png" width="1920" />

-   Chat Tab:

    -   Add a chatBox() together with chatContactList(), chatContact(), chatMessage() for creating direct chat.

<img src="fig/chat_box_01.png" width="1920" />

<img src="fig/chat_box_02.png" width="1920" />

<img src="fig/chat_box_03.png" width="1920" />

-   Calendar Tab:

    -   TODO: why calendar won't show up?

<img src="fig/calendar_box.png" width="1920" />

-   Database Tab:

    -   A worth mention feature is that we can use javascripts, such as enter\_as\_click.js along with this app, to bind the sidebar search form or general shiny input box with a button, so that we can catch the event when the search form or input box is focused and user hit enter key on keyboard, without requiring a must click on the button.

<img src="fig/database.png" width="1920" />

-   Table Tab:

<img src="fig/table.png" width="1920" />

-   Figure Tab:

<img src="fig/figure.png" width="1920" />

-   Map Tab:

<img src="fig/map.png" width="1920" />

-   Timeline Tab:

<img src="fig/timeline.png" width="1920" />

-   Documentation Tab:

<img src="fig/documentation.png" width="1920" />

NEWS
----

-   2016.08.10: Add `socialWidgetBox()` on **Chat Tab**, source from `boxes.R` in `ygdashboard`.

-   2016.08.08: Add `carouselBox()`, `carouselSets()`, `carouselItem()` on **Carousel Tab**, source from `boxes.R` in `ygdashboard`.

TODO
----

-   dashboardControlbar.R: create functions that can create sub-components in control-sidebar, like functions defined in dashboardSidebar.R.
