UsersApp.controller 'UsersCtrl', ['$scope', 'User', ($scope, User) ->
  $scope.users = User.query()
  $scope.selectedUser = null
  
  $scope.showUser = (user) ->
    console.log("selectedUser ", user)
    $scope.selectedUser = user
    $scope.selectedUser.admin = (user.admin != null && user.admin)
]
