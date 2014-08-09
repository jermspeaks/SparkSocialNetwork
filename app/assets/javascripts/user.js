$( document ).ready(function() {

  toggleAddBox = function() {
  	var box = $('#all-users'); 
        var duration = "slow";  
        if (box.css('visibility') == 'visible') {
            box.fadeTo(duration, 0, function () {
                box.css({ visibility: "hidden" });
            });
        } else {
            box.fadeTo(duration, 1).css({ visibility: "visible" });
        }
  	}	

  $('#add-friend').on('click', '#add-button', function(event) {
  	event.preventDefault();
  	toggleAddBox();
  });
});