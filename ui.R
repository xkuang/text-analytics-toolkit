header = dashboardHeader(titleWidth = 300,title = "Text Analytics Toolkit")

sidebar = dashboardSidebar(
  width=300,
  sidebarMenu(
    menuItem(
      text="1. Upload Text",
      icon=icon("upload"),
      tabName="upload"
    ),
    menuItem(
      text="2. Settings",
      icon=icon("gear"),
      tabName="settings"
    ),
    menuItem(
      text="3. Word Frequency Analysis",
      icon=icon("sort-alpha-asc"),
      tabName="wordfreq"
    ),
    menuItem(
      text="4. Topic Modelling",
      icon=icon("comment"),
      tabName="topicmodel"
    ),
    menuItem(
      text="About",
      icon=icon("info-circle"),
      tabName="about"
    )
  )
)

body = dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "main.css")
  ),
  HTML("
    <div data-role='header' data-position='fixed'>
      <h4><strong>&copy; Winston Chan 2017</strong></h4>
    </div>
  "),
  tabItems(
    source("tabs/upload.R",local=TRUE)$value, 
    source("tabs/settings.R",local=TRUE)$value,
    source("tabs/wordfreq.R",local=TRUE)$value,
    source("tabs/topicmodel.R",local=TRUE)$value,
    source("tabs/about.R",local=TRUE)$value
  )
)

dashboardPage(
  header=header, 
  sidebar=sidebar,
  body=body,
  skin="purple"
)



