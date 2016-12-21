tabItem(
  tabName="upload",
  fluidPage(
    fluidRow(
      box(
        title="Upload your text data",status="primary",solidHeader=TRUE,width=6,
        fileInput(
          inputId="upload_input",
          label="Select file (.csv or .tsv format)",
          accept=c(
            'text/csv','text/comma-separated-values,text/plain','.csv',
            'text/tsv','text/tab-separated-values,text/plain','.tsv'
          )  
        ),
        actionButton(
          inputId = "upload_useReuters",
          label = "Use sample data (Reuters-21578)",
          icon = icon("table")
        ),
        tags$hr(),
        checkboxInput(
          inputId = "upload_header",
          label = "Contains Header",
          value = TRUE
        ),
        radioButtons(
          inputId = "upload_sep",
          label = "Type of column seperators",
          choices = c(Comma=',',Tab='\t'),
          selected=','
        ),
        radioButtons(
          inputId = 'upload_quote', 
          label = 'Enclosing Characters of Quotes',
          choices =  c('No Quotes'='','Double Quote'='"','Single Quote'="'"),
          selected = '"'
        )
      )
    ),
    fluidRow(
      box(
        title="Preview Dataset",status="success",solidHeader=TRUE,width=12,
        DT::dataTableOutput("upload_preview")
      )
    )
  )
)