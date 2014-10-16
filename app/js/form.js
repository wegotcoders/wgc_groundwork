$(document).ready( function() {
  function buttonToForm() {
    $('.btn-form').click(function(){
      //animate
      $('html, body').stop().animate(
        { scrollTop: $('#form').offset().top - 182 }, 400
      );
      return false;
    });
  }
  buttonToForm();
});
