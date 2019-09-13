$(document).on('turbolinks:load', function() {
  $('.chat').scroll(function() {
    if($(this).scrollTop() == 0) {
      console.log("Top scroll")
      before = $('.messages_ids').attr('value')
      url = $('.chat').data('url')
      $.get(url, {before: before} ) //The "before" variable holds the last message box id, for pagination purpouse's
    }
  })
})
