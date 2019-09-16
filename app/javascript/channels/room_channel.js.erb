import consumer from "./consumer"

$(document).on('turbolinks:load', function() {
    $('[data-channel-subscribe="room"]').each(function(index, element) {
    var $element = $(element),
        messageTemplate = $('[data-role="message-template"]'),
        room_id = $element.data('room-id')

    $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000)

    consumer.subscriptions.create({ channel: "RoomChannel", room: room_id }, {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        var content = messageTemplate.children().clone(true, true);
            content.find('[data-role="message-text"]').text(data.message);
            content.find('[data-role="message-date"]').text(data.created_at);
            content.find('[data-role="user-name"]').text(data.username + ": ")
            $element.append(content);
            $element.animate({ scrollTop: $element.prop("scrollHeight")}, 1000);
       }
    })
  });
});

