# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
#  Autocomplete
  $('#requeriment').autocomplete
    source: (request, response) ->
      $.ajax(
        url: '/scripts/autocomplete_requeriment.json',
        dataType: 'json',
        data: request,
        success: (data) ->
          response $.map(data, (script) ->
            label: script.name
            value: script.name
            id: script.id
          )
      )
    select: (event, ui) ->
      $("#requirement_script_id_requirement").val(ui.item.id);

    change: (event, ui) ->
      if ui.item == null
        $("#requirement_script_id_requirement").val('');


  defaultVal = '';
  #  Autocomplete with response map for related_scripts
  $('#related_script').autocomplete
    minLength: 2
    source: (request, response) ->
      $.ajax(
        url: '/scripts/autocomplete_related_script.json',
        dataType: 'json',
        data: request,
        success: (data) ->
          response $.map(data, (script) ->
            label: script.name
            value: script.name
            id: script.id
          )
      )
    change: (event, ui) ->
      if ui.item == null
        $("#related_script_script_id").val('');
        $("#related_script_related_script_id").val('');
        alert 'Please select a value from the list'

    select: (event, ui) ->
      $("#related_script_related_script_id").val(ui.item.id);
@requirement
#    focus: (event , ui) ->
#      console.log(ui)
#      if ui != null
#        defaultVal = ui.item.label;
#      else
#        defaultVal = ''
#
#    close:(event , ui) ->
#      $("#related_script").val(defaultVal);


