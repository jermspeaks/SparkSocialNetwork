$( document ).ready(function() {
  var addBox = $('#all-users');
  var requestBox = $('#all-requests');

  // var userID =

  $('.carousel').carousel({
    height: 300
  });


  toggleBox = function(box) {
        var duration = "slow";
        if (box.css('visibility') == 'visible') {
            box.fadeTo(duration, 0, function () {
                box.css({ visibility: "hidden" });
            });
        } else {
            box.fadeTo(duration, 1).css({ visibility: "visible" });
        }
  	}

  $('nav.navigation-bar-content').on('click', 'a#add-button', function(event) {
  	event.preventDefault();
  	toggleBox(addBox);
  });


  $('nav.navigation-bar-content').on('click', 'a#see-request', function(event) {
    event.preventDefault();
    toggleBox(requestBox);
  });



  $("#change-avatar").on('submit', 'form', function(event) {
      $("body :not(#loading)").css("opacity", "0.6");
      $('#loading').css("opacity", "1");
      $('#loading').css("visibility", "visible");
  });

  $("#upload-new-photo").on('submit', 'form', function(event) {
      $("body :not(#loading)").css("opacity", "0.6");
      $('#loading').css("opacity", "1");
      $('#loading').css("visibility", "visible");
  });

  $('#all-users').on('click', 'button#send-request', function(event) {
    event.preventDefault();
    var $curr = $(this);
    var receiverID = $curr.parent().find('a').attr("href").split("/").pop();
    $curr.parent().remove();
    sendData = {receiver_id: receiverID};
    $.ajax({
      type: "POST",
      url: '/users/send.json',
      data: sendData,
      dataType: "json"
    });
  });

  $('#all-requests').on('click', 'button#accept', function(event) {
    event.preventDefault();
    var $curr = $(this);
    var requesterID = $curr.parent().find('a').attr("href").split("/").pop();
    $curr.parent().remove();
    sendData = {requester_id: requesterID};
    $.ajax({
      type: "POST",
      url: '/users/accept.json',
      data: sendData,
      dataType: "json"
    });
  });

  $('#all-requests').on('click', 'button#reject', function(event) {
    event.preventDefault();
    var $curr = $(this);
    var requesterID = $curr.parent().find('a').attr("href").split("/").pop();
    $curr.parent().remove();
    sendData = {requester_id: requesterID};
    $.ajax({
      type: "POST",
      url: '/users/reject.json',
      data: sendData,
      dataType: "json"
    });
  });


  $('.carousel').carousel({
      auto: false,
      period: 3000,
      duration: 2000,
      markers: {
          type: "square"
      }
  });

});
