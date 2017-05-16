
$(document).ready(function(){
  $('.signup-btn').click(function(){
    $('#user_sign_up').toggle();
  });
  //flashcards
  $('.flashcard').on('click', function() {
      $('.flashcard').toggleClass('flipped');
    });
});
