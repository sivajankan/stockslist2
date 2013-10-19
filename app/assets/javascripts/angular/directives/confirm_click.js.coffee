StocklistsApp.directive "ngConfirmClick", ->
  link: (scope, element, attr) ->
    msg = attr.ngConfirmClick || "Are you sure?";
    clickAction = attr.confirmedClick;
    
    element.bind "click", (event) ->
      if ( window.confirm(msg) )
        scope.$apply(scope.$eval(clickAction))