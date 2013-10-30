StocklistsApp.controller 'StocklistsCtrl', ['$scope', 'Stocklist', ($scope, Stocklist) ->
  $scope.stocklists = Stocklist.query()
  $scope.selectedStocklist = null
  $scope.predicate = 'symbol'
  
  $scope.showStocklist = (stocklist) ->
    $('#stocklist-new-container').hide()
    $scope.selectedStocklist = stocklist
    window.load_yahoo_short_info(stocklist.symbol)
    window.load_stock_image_url(stocklist.symbol)
    $('#stock_short_info').show()
    
  $scope.showNewStocklist = () ->
    $scope.selectedStocklist = undefined
    $('#stock_short_info').hide()
    $('#stocklist-new-container').show()
    
  $scope.addNewStocklist = (newStocklist) ->
    $scope.stocklists.push(newStocklist)
    Stocklist.save(newStocklist)
    
  $scope.deleteStocklist = (delStocklist) ->
    index = $scope.stocklists.indexOf(delStocklist)
    $scope.stocklists.splice(index, 1)
    Stocklist.delete(delStocklist)
    $scope.selectedStocklist = null
    
     
  $scope.updateStocklist = (updateStocklist) ->
    Stocklist.update(updateStocklist)
    
]
