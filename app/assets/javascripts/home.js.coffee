# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

failure = (msg) ->
  if console && console.log 
    console.log msg
  else 
    alert msg
  
stock_image_url = (id, day_text) ->
  url = $('#'+id).attr('src')
  url = url.substr(0, url.indexOf('p='))
  url = url + "p=" + day_text
  return url
  
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
      
window.load_yahoo_short_info = (symbol) ->
  url = "stock_fetch/yahoo_short_info.json?yahoo_symbol="+symbol
  $.ajax
    url: url
    success: (data) ->  
      stockdata = data[symbol]
      $.each(stockdata, (key, value) ->
         $("td#"+key).html(value)
      )

    failure: (data) ->
      $("td#name").html("<b>Yahoo data fetch failed<b>")

window.load_stock_image_url = (symbol) ->
  url = "stock_fetch/stock_image.json?symbol="+symbol
  console.log("url", url)
  $.ajax
    url: url
    success: (data) -> 
      console.log("data", data)
      $('img#stock_image_short').attr('src', data['url'])
      $('img#stock_image').attr('src', data['url'])
      $('img#fancy_image').attr('src', data['url'])
      
    failure: (data) ->
      $('img#stock_image_short').attr('src', "ERROR")
  
      
#Update google graph based on the period selection 
$().ready ->
  $('#period_selection td').on 'click', (evt) ->
    evt.preventDefault()
    $('#period_selection td').css('color', 'black')
    $('#period_selection td').css('text-decoration', 'none')
    $(this).css('color', 'blue')
    $(this).css('text-decoration','underline')
    $("[id='fancy_image']").attr("src", stock_image_url("fancy_image", $(this).text()));
    $("[id='stock_image']").attr("src", stock_image_url('stock_image', $(this).text()));
    return false
    
