// jQuery(document).ready(function($) {
  $('.delete_room').bind('ajax:success', function() {
    // debugger
    $(this).hide();
    var textnode = document.createTextNode("There are no rooms avaiable");
    $("#room_header").append(textnode);
  });
// });
