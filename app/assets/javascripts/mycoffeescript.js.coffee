$ ->

  validateEmail = (email)-> 
    re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
    return re.test(email)
  
  $("input#user_email").on "blur", ->
    email = $(@).val()
    if validateEmail(email)
      $("span#email_status").text("✓").css("color", "green")
    else
      $("span#email_status").text("X").css("color", "red") 




  $("#draggable1").draggable()
  $("#draggable2").draggable()
  $("#draggable3").draggable()
  $("#droppable").droppable
    drop: (event, ui)->
      alert("You've dropped " + $(ui.draggable).attr("id") )
  

  index = 0
  buttonClass = ["btn-primary", "btn-danger", "btn-info"]


  $(".myButton").on "click", ->
    $(@).toggleClass(buttonClass[index])
    if index >= (buttonClass.length - 1)
      index = 0
    else
      index += 1
    $(@).addClass(buttonClass[index])


  $(".chkbox").on "change", ->
    if (@).checked
      $(@).siblings().addClass("checked")
      $p = $(@).parent()
      $p.appendTo($(".complete"))
    else
      $(@).siblings().removeClass("checked")
      $p = $(@).parent()
      $p.appendTo($(".pending"))

    