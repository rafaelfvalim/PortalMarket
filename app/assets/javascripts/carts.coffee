# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#cart_form').validate
    rules:
      'cart[workplace_attributes][system_number]':
        minlength: 3
        required: true
      'cart[workplace_attributes][organization_name]':
        minlength: 5
        required: true
