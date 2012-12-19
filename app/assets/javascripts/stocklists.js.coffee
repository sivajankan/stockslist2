# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $(".datepicker").datepicker ({
    showOn: "button",
    buttonImage: "images/calendar.gif",
    buttonImageOnly: true,
    changeMonth: true,
    changeYear: true,
  })
