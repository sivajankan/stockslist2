# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

failure = (msg) ->
  alert msg
  console.log msg
  
# Fetch yahoo info for given stock symbol
window.load_yahoo_info = (url) ->
  $.ajax
    url: url
    success: (data) ->  
      $("div#stock_info").html(data)

    failure: (data) ->
      failure "Yahoo data fetch failed"

  $.ajax
    url: url + "&group=2",
    success: (data) ->
      $("div#stock_info2").html(data)
      $($('#period_selection td')[0]).css('color', 'blue')
      $($('#period_selection td')[0]).css('text-decoration','underline')

    failure: (data) ->
      failure "Yahoo data fetch failed"
      
#Update google graph based on the period selection 
$().ready ->
  $('#period_selection td').on 'click', (evt) ->
    evt.preventDefault()
    url = $('#stock_image').attr('src')
    url = url.substr(0, url.indexOf('p='))
    url = url + "p=" + $(this).text()
    $('#period_selection td').css('color', 'black')
    $('#period_selection td').css('text-decoration', 'none')
    $(this).css('color', 'blue')
    $(this).css('text-decoration','underline')
    $("[id$='stock_image']").attr("src", url);