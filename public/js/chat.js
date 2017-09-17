$(document).ready(function() {
  $('.btn-chat').click(function(){
    var hours = new Date(hours);
    var minutes = new Date(minutes);
     var val = $.trim($("textarea").val());
      $('.messages').html('
      <section class="card message"><div class="card-block"><span class="card-title">Janna</span><span class="sent-time">' + hours + ':' + minutes + 'PM</span><p class="card-text">' + val + '</p></div></section>');
  });
});
