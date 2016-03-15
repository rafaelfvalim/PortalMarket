$ ->
  $('#orchestration_form').validate
    rules:
      'status[id]':
        required: true

  $(".chat_box").scrollTo('100%');