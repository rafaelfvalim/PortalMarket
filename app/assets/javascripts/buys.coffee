# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

is_in_cart = (script_id, organization_name, system_number) ->
  dataResponse = ''
  $.ajax
    type: 'GET',
    url: '/buys/verify_workplace_cart.json'
    dataType: "json"
    async: false
    data:
      script_id: script_id
      organization_name: organization_name
      system_number: system_number
    success: (data) ->
      dataResponse = data
      return
  return dataResponse

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

  $("#submit_invoice").on "click", (e) ->
    script_id = $("#cart_script_id").val()
    organization_name = $("#cart_workplace_attributes_organization_name").val()
    system_number = $("#cart_workplace_attributes_system_number").val()
    check = is_in_cart(script_id, organization_name, system_number)
    if organization_name == "" || system_number == ""
      $('html, body').animate {scrollTop: $("#cart_workplace_attributes_organization_name").offset().top - 300}, 800
    else
      if check
        swal {
          title: 'Item ja adicionado ao carrinho!'
          text: 'Adicionar novamente?'
          type: 'warning'
          showCancelButton: true
          confirmButtonColor: '#2b64ff'
          confirmButtonText: 'Sim'
          cancelButtonText: 'Não'
          closeOnConfirm: true
          closeOnCancel: true
        }, (isConfirm) ->
          if isConfirm
            $('#cart_form').submit()
          return
      else
        swal {
          title: 'Adicionar item ao carrinho?'
          type: 'warning'
          showCancelButton: true
          confirmButtonColor: '#2b64ff'
          confirmButtonText: 'Sim'
          cancelButtonText: 'Não'
          closeOnConfirm: true
          closeOnCancel: true
        }, (isConfirm) ->
          if isConfirm
            $('#cart_form').submit()