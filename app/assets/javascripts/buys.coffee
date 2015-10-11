# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  count = 0
  $("#add_carts").click (e) ->
    if confirm('Add item do cart?')
      $.ajax
        type: 'POST'
        url: '/carts'
        data: {
          cart: {member_id: gon.member_id, script_id: gon.script_id, price_id: gon.price_id, full_sale : 0 }
        },
        beforeSend:  ->
          codeStore.showPleaseWait()
        success: (data) ->
          count = Number($('.badge').text(  ))
          count++
          $('.badge').text(count)
          codeStore.hidePleaseWait()
        errors: (data) ->
          alert data