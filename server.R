options(shiny.maxRequestSize = 45 * 1024^2)

shinyServer(function(input, output) {

  userInputs = reactiveValues(
    data = data_frame()
  )
  
  ## Use sample dataset
  observeEvent(input$upload_useReuters,{
    userInputs$data = readRDS("data/reuters.rds")
    cat(str(isolate(userInputs$data)))
  })
  
  ## Use uploaded dataset
  observeEvent(input$upload_input,{
    inFile <- input$upload_input
    cat(str(inFile))
    if (!is.null(inFile)){
      userInputs$data = read_delim(
        file = inFile$datapath,
        delim=input$upload_sep,
        col_names=input$upload_header, 
        quote=input$upload_quote
      )
      cat(str(isolate(userInputs$data)))
    }
  })
  
  ## Preview
  output$upload_preview = DT::renderDataTable({
    df = userInputs$data
    DT::datatable(df,class="compact cell-border")
  })

})
