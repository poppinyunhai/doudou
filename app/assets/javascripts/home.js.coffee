$ ->
  swaggerUi = new SwaggerUi
    url: "http://poppinyunhai_2.tunnel.mobi/api/v1/doc.json"
    dom_id: "swagger-ui-container"
    supportedSubmitMethods: ['get', 'post', 'put', 'delete']
    onComplete: (swaggerApi, swaggerUi)->
      if console
        console.log "Loaded Swagger UI"
        console.log swaggerUi
      $('pre code').each (i, e)-> hljs.highlightBlock e
    onFailure: (data)->
      if console
        console.log "Unable to Load Swagger UI"
        console.log data
    docExpansion: "list"
  swaggerUi.load()
