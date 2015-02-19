# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("form#new_user :input#user_name").keyup (e) ->
    $(this).val($(this).val().titleize())
    return
  $("form#new_user :input#user_dob").keyup (e) ->
    return
  $("form#new_user :input#user_ssn").keyup (e) ->
    return
    
  $("form#new_user").submit (e) ->
    e.preventDefault()
    time = 5000
    setTimeout sendAjax, time
    $('#loading-modal').modal 'show'
    modalProgressBar()
    return
  return

i = 0
modalProgressBar = ->
  setTimeout (->
    percent = i.toString() + "%"
    $("div.progress-bar").width(percent).text(percent)
    i++
    modalProgressBar() if i < 100
    return
  ), 50
  return

sendAjax = ->
  $('#loading-modal').modal 'hide'
  return