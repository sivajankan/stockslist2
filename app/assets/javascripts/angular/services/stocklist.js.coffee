StocklistsApp.factory 'Stocklist', ['$resource', ($resource) ->
  # console.log "stocklist factory is called"
  $resource '/api/stocklists/:id', id: '@id',
   update: {
     method: 'put'
     }
]