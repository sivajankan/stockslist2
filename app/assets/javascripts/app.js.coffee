window.UsersApp = angular.module('Users', ['ngResource'])
window.StocklistsApp = angular.module('Stocklists', ['ngResource'])
window.StocklistsApp.config([
  "$httpProvider", ($httpProvider) ->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = angular.element('meta[name=csrf-token]').attr('content')
]);