# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#cart_form').validate
    focusInvalid: false
    rules:
      'cart[workplace_attributes][system_number]':
        minlength: 3
        required: true
      'cart[workplace_attributes][organization_name]':
        minlength: 5
        required: true
    invalidHandler: (form, validator) ->
      if !validator.numberOfInvalids()
        return
      $('html, body').animate {scrollTop: $(validator.errorList[0].element).offset().top-300}, 800




