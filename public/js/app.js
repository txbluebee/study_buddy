$(document).ready(function() {
  $(this).on('click', function() {

    var i = $(this).attr('id');
  
    $(this).toggle('.flipped');
  });
});


  // $(this).next(".card").flip();


  // $(document).ready(function() {
  //   $('.flashcard').on('click', function() {
  //     $('.flashcard').toggleClass('flipped');
  //   });
  // });
