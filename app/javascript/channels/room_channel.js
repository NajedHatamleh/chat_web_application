import consumer from "./consumer"
// var id = document.getElementById('room_message_room_id').value
// debugger

document.addEventListener('DOMContentLoaded', function(){
       window.room_id = document.getElementById('room_message_room_id').value;

consumer.subscriptions.create({ channel: "RoomChannel", room: window.room_id }, {
  connected() {
    // Called when the subscription is ready for use on the server
	$('[data-channel-subscribe="room"]').each(function(index, element) {
    debugger
    window.$element = $(element)
        // room_id = $element.data('room-id')
    window.messageTemplate = $('[data-role="message-template"]');

    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000) })
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
		var content = messageTemplate.children().clone(true, true);
        content.find('[data-role="message-text"]').text(data.message);
        content.find('[data-role="message-date"]').text(data.updated_at);
        $element.append(content);
        $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
  }
});
}, false);
