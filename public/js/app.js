
$(document).ready(function(){
  //add new languages
  $('.add_language').click(function(){
    $('#add_language').show();
  });

  //flashcards
  $('.flashcard').on('click', function() {
      $('.flashcard').toggleClass('flipped');
    });
});
