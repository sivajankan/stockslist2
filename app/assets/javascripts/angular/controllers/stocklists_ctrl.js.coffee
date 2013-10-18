StocklistsApp.controller 'StocklistsCtrl', ['$scope', 'Stocklist', ($scope, Stocklist) ->
  $scope.stocklists = Stocklist.query()
  $scope.selectedStocklist = null
  $scope.predicate = 'symbol'
  
  $scope.showStocklist = (stocklist) ->
    #console.log("selectedStocklist ", stocklist)
    $('#stocklist-new-container').hide()
    $scope.selectedStocklist = stocklist
    
  $scope.showNewStocklist = () ->
    #console.log("New stocklist is loaded")
    $scope.selectedStocklist = undefined
    $('#stocklist-new-container').show()
    
  $scope.addNewStocklist = (newStocklist) ->
    $scope.stocklists.push(newStocklist)
    Stocklist.save(newStocklist)
    
  #$scope.updateStocklist = (edited) ->
  #  console.log("edited", angular.copy(edited))
    
]
