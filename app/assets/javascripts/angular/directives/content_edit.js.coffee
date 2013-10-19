StocklistsApp.directive "contenteditable", ->
  require: "ngModel"
  link: (scope, elm, attrs, ctrl) ->
    #console.log "link is called"
    
    # view -> model
    elm.on "blur", ->
      scope.$apply ->
        ctrl.$setViewValue elm.html().trim().replace(/[&]nbsp[;]/gi," "); 
    
    # model -> view
    ctrl.$render = (value) ->
      elm.html value

    # load init value from DOM
    #console.log "showing in default"
    #ctrl.$setViewValue elm.html()



# StocklistsApp.directive "contenteditable", ->
  # require: "ngModel"
  # link: (scope, elm, attrs, ctrl) ->
    # elm.bind "blur", ->
      # scope.$apply ->
        # ctrl.$setViewValue elm.html()
# 
    # ctrl.render = (value) ->
      # elm.html value
# 
    # ctrl.$setViewValue elm.html()
    # elm.bind "keydown", (event) ->
      # console.log "keydown " + event.which
      # esc = event.which is 27
      # el = event.target
      # if esc
        # console.log "esc"
        # ctrl.$setViewValue elm.html()
        # el.blur()
        # event.preventDefault()    
