# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#add_requeriment').click ->
    requeriment = $("#input-requeriment").val();
    script_id =  $("#input-script_id").val();
    $.ajax
      type: 'POST'
      url: '/requirements'
      data: { requirement: { script_id: script_id , requirement: requeriment } },
      success: (data) ->
        $("#input-script_id").attr('value', '');
        alert "dados inseridos com sucesso!"
        $("#requeriments_list ul").append("<li>" + requeriment + "</li>");
      errors: (data) ->
        alert data