$(document).ready(function() {
  $('.parent').click(function(){
      $(this).parent().hide();
      $('.parent-select-btns').show();
  });

  $('.volunteer').click(function(){
      $(this).parent().hide();
      $('.volunteer-select-btns').show();
  });
});
