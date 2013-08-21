StocklistsApp.factory 'Stocklist', ['$resource', ($resource) ->
  $resource '/api/stocklists/:id', id: '@id'
]