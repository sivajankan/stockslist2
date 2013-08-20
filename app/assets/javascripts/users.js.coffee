# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.UserInfo  = ($scope, $http, $location) ->
  $scope.name = 'Test Name'
  $http.get("#{$location.$$absUrl}.json").then ((response) ->
    console.log(response.data)
    $scope.user = response.data)
  console.log("user:",$scope.user)
  #console.log("location:",$location)
  #console.log("url", $location.$$absUrl)
