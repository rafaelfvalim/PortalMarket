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

#  $('#cart_workplace_attributes_organization_name').autocomplete
#    minLength: 2
#    source: (request, response) ->
#      $.ajax(
#        url: '/buys/autocomplete_organization.json',
#        dataType: 'json',
#        data: request,
#        success: (data) ->
#          response $.map(data, (workplace) ->
#            label: workplace.organization_name
#            value: workplace.organization_name
#            id: workplace.id
#            system_number: workplace.system_number
#
#          )
#      )
#    select: (event, ui) ->
#      $("#cart_workplace_attributes_system_number").val(ui.item.system_number);
#      $("#cart_workplace_attributes_id").val(ui.item.id);
##      $("html, body").animate({scrollTop: 0}, "fast");
#    change: (event, ui) ->
#      $("#cart_workplace_attributes_id").val('');
  $('#cart_form').validate
    focusInvalid: false
    rules:
      'cart[workplace_attributes][system_number]':
        minlength: 3
        required: true
      'cart[workplace_attributes][organization_name]':
        minlength: 5
        required: true
    submitHandler: (form, event) ->
      script_id = $("#cart_script_id").val()
      organization_name = $("#cart_workplace_attributes_organization_name").val()
      system_number = $("#cart_workplace_attributes_system_number").val()
      if is_in_cart(script_id, organization_name, system_number)
        if confirm 'Item ja adicionado ao carrinho, deseja adicionar novamente?'
          true
        else
          false
      else
        if confirm 'Adicionar item ao carrinho?'
          true
        else
          false
    invalidHandler: (form, validator) ->
      if !validator.numberOfInvalids()
        false
      $('html, body').animate {scrollTop: $(validator.errorList[0].element).offset().top - 300}, 800

