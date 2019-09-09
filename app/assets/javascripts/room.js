$(function() {
  $('#new_room_message').on('ajax:success', function(a, b, c) {
    $(this).find('input[type="text"]').val('');
  });
});

// $(function() {
//  if ( $('#username-id').html().length != 0)
