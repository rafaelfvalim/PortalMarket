# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#cart_workplace_attributes_organization_name').autocomplete
    minLength: 2
    source: (request, response) ->
      $.ajax(
        url: '/buys/autocomplete_organization.json',
        dataType: 'json',
        data: request,
        success: (data) ->
          response $.map(data, (workplace) ->
            label: workplace.organization_name
            value: workplace.organization_name
            id: workplace.id
            system_number: workplace.system_number
          )
      )
    select: (event, ui) ->
      $("#cart_workplace_attributes_system_number").val(ui.item.system_number);