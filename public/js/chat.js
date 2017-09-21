$(document).ready(function() {
  $('.btn-chat').click(function(){
    var now = new Date();
    var hours = now.getHours();
    var minutes = now.getMinutes();
    var val = $('textarea').val();
    var name = $('h2').text();
      $('.messages').append('<section class="card message"><div class="card-block"><span class="card-title">Rebecca</span><span class="sent-time">' + hours + ':' + minutes + 'PM</span><p class="card-text">' + val + '</p></div></section>');
      $(".messages").scrollTop($(".messages")[0].scrollHeight);
      $('textarea').val(" ");
  });
});
