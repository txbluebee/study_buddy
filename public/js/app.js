
$(document).ready(function(){




  //flashcards
  $(this).on('click', function() {

    var i = $(this).attr('id');

    $(this).toggle('.flipped');
  });
});
