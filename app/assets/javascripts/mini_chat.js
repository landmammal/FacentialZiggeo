function ready() {

  var myCounter = 0;

  $("#new-message-body").keydown(function() {
    var now = new Date(), now = now.getHours()+':'+now.getMinutes()+':'+now.getSeconds();
    var x = $('#new-message-body').val();

    if (event.keyCode == 13) {
      myCounter++;
      if (myCounter % 3 === 0) { var id = "Me"}
      else if (myCounter % 3 === 1) { var id = "Myself"}
      else if (myCounter % 3 === 2) { var id = "I"}

      $('#conversation').append('<li class="message"><a class="delete" href="#">Delete</a><h3 class="author">'+id+'</h3><p class="message-body">'+ x +'</p><span class="timestamp">'+ now +'</span></li>');
      $('#new-message-body').val("");

    }

    $('.delete').click(function() {
      event.preventDefault();
      $(this).parent().remove();
    });

  });



  $('#new-message-button').click(function() {

    myCounter++;
    if (myCounter % 3 === 0) { var id = "Me"}
    else if (myCounter % 3 === 1) { var id = "Myself"}
    else if (myCounter % 3 === 2) { var id = "I"}

    var now = new Date(), now = now.getHours()+':'+now.getMinutes();
    var x = $('#new-message-body').val();
    $('#conversation').append('<li class="message"><a class="delete" href="#">Delete</a><h3 class="author">'+id+'</h3><p class="message-body">'+ x +'</p><span class="timestamp">'+ now +'</span></li>');
    $('#new-message-body').val("");
    myCounter++;

    $('.delete').click(function() {
      event.preventDefault();
      $(this).parent().remove();
    });

  });



  $("#lonely").click(function() {
    event.preventDefault();
    var now = new Date(), now = now.getHours()+':'+now.getMinutes()+':'+now.getSeconds();


    $.getJSON('http://api.icndb.com/jokes/random', function(data) {
        var yoyoyo=String(data["value"]["joke"]);

        console.log(yoyoyo);
        $('#conversation').append('<li class="message"><a class="delete" href="#">Delete</a><h3 class="author">Internet</h3><p class="message-body">'+yoyoyo+'</p><span class="timestamp">'+now+'</span></li>');

        $('.delete').click(function() {
          event.preventDefault();
          $(this).parent().remove();
        });
    });

  });

}



$(document).on('ready page:load', ready);
