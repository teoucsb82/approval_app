# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#user_dob").datepicker()

  $("form#new_user :input#user_name").keyup ->
    $(this).val(@value.titleize())
    return
  $("form#new_user :input#user_ssn").keyup ->
    @value = @value.replace(/[^-,\d]+/g, '')
    val = @value.replace(/\D/g, '')
    first = val.slice(0,3)
    mid = val.slice(3,5)
    last = val.slice(5, 9)
    current = val.slice(val.length - 1, val.length)
    @value = [first, current].join("-") if val.length == 4
    @value = [first, mid, current].join("-") if val.length == 6
    return

  $("form#new_user").submit (e) ->
    e.preventDefault()
    flag = true
    $("#user_name, #user_dob, #user_ssn").removeClass("has-error")
    $(".form-errors").hide()
    $("#user_name, #user_dob, #user_ssn").each ->
      if @value.length == 0
        $(this).parents(".form-group").addClass("has-error")
        flag = false
        $(".form-errors").fadeIn()
      return
    return unless flag == true
    time = 5000
    setTimeout send_ajax, time
    $('#loading-modal').modal 'show'
    modal_progress_bar()
    return

  $("li").mouseenter ->
    $(this).addClass('animated pulse').css("cursor", "initial")
  $("li").mouseleave ->
    $(this).removeClass('animated pulse').css("cursor", "auto")
  return

i = 0
messages = ["640K ought to be enough for anybody",
            "the architects are still drafting",
            "the bits are breeding",
            "we're building the buildings as fast as we can",
            "would you prefer chicken, steak, or tofu?",
            "pay no attention to the man behind the curtain",
            "and enjoy the elevator music",
            "while the little elves draw your map",
            "a few bits tried to escape, but we caught them",
            "and dream of faster computers",
            "would you like fries with that?",
            "checking the gravitational constant in your locale",
            "go ahead -- hold your breath",
            "at least you're not on hold",
            "hum something loud while others stare",
            "you're not in Kansas any more",
            "the server is powered by a lemon and two electrodes",
            "we love you just the way you are",
            "while a larger software vendor in Seattle takes over the world",
            "we're testing your patience",
            "as if you had any other choice",
            "take a moment to sign up for our lovely prizes",
            "don't think of purple hippos",
            "follow the white rabbit",
            "why don't you order a sandwich?",
            "while the satellite moves into position",
            "the bits are flowing slowly today",
            "dig on the 'X' for buried treasure... ARRR!",
            "it's still faster than you could draw it"]
modal_progress_bar = ->
  setTimeout (->
    percent = i.toString() + "%"
    $("div.progress-bar").width(percent).attr("aria-valuenow", i).text(percent)
    $("#loading-modal .modal-title").text(messages[Math.floor(Math.random() * messages.length)].capitalize()) if i % 33 == 0
    i++
    if i < 100
      modal_progress_bar() 
    else
      i = 0
    return
  ), 50
  return

send_ajax = ->
  $("div.progress").addClass("animated fadeOut").removeClass("animated fadeOut")
  $("#loading-modal").modal('hide')
  $('form#new_user').find("input[type=text], textarea").val("")
  fire_success_growl()
  return

fire_success_growl = ->
  $.growl
    title: 'ZOMG!'
    message: 'You have been approved!'
    size: 'large'
    location: 'br'
  return