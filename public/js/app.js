
$(document).ready(function(){
  //add new languages
  $('.add_language').click(function(){
    $('#add_language').show();
  });



  //flashcards
  $(this).on('click', function() {

    var i = $(this).attr('id');

    $(this).toggle('.flipped');
  });
});
