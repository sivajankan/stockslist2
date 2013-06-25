# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


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
    #alert url
    $("[id$='stock_image']").attr("src", url);
