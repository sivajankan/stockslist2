StocklistsApp.controller 'StocklistsCtrl', ['$scope', 'Stocklist', ($scope, Stocklist) ->
  $scope.stocklists = Stocklist.query()
  $scope.selectedStocklist = null
  
  $scope.showStocklist = (stocklist) ->
    console.log("selectedStocklist ", stocklist)
    $scope.selectedStocklist = stocklist
]
