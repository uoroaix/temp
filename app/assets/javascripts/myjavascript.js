var state = false;

$(document).ready(function() {


  $(document).on("click", ".remove-button", function(){
  $(this).parents(".well").fadeOut();
  });




  $(document).on("keyup", "#enter_box", function(event) {
    var keycode;
    keycode = event.keyCode ? event.keyCode : event.which;
    if(keycode === 13) {
      var $msg = $(".my_box").val();
      var $li = $("<li>", {text: $msg});
      $("ul.enterbox").append($li);
      $(".my_box").val("");
    }
  });


  $(document).on("click", "ul.enterbox li", function(){
    $(this).fadeOut();
  });


  $(document).on("focus", "#box2", function(){
    if (!$(this).val()) {
      $("span.box2-side").text("start typing...");
      $("#box2").val("");
    };
  });

  $(document).on("keyup", "#box2", function(event){
    if(event.which === 9) {
      return;
    }
    var $character = $("#box2").val();
    var reverse = $("#box2").val().split("").reverse().join("");
    $("span.box2-side").text(reverse);
  });


  $(document).on("focusout", "#box2", function(){
    $("#box2").val("");
    $("span.box2-side").text("");
  });


  $(document).on("click", ".submit-box3", function(){
    var result;
    result = "First Name: " + $("input#first_name").val() + " " +
             "Last Name: " + $("input#last_name").val() + " " +
             "Email: " + $("input#email").val();
    $(".box3").text(result);

  });


  $(document).on("click", ".start", function(){
    if(state === false){
      state = true;
      $(".start").css("background-color", "red").css("position", "fixed");
      randomButton();
    }else{
      $(".start").hide();
      $(".success").css("visibility","visible");
      return false;
    }
  });


var randomButton = function(){
  var xMax = $(window).width() - $(".start").width();
  var yMax = $(window).height() - $(".start").height();

  var randomX = Math.floor(Math.random() * xMax);
  var randomY = Math.floor(Math.random() * yMax);

  $(".start").css("left", randomX + "px").css("top", randomY + "px")
  setTimeout(randomButton, 1000 );
}



});

