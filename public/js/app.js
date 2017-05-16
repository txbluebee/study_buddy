
$(document).ready(function(){
  $('.signup-btn').click(function(){
    $('#user_sign_up').toggle();    
  });
  //flashcards
  $(this).on('click', function() {

    var i = $(this).attr('id');

    $(this).toggle('.flipped');
  });
});
