$( document ).ready(function() {
  var addBox = $('#all-users');
  var requestBox = $('#all-requests');


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

});
