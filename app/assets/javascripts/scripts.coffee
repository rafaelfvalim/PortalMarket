# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#add_requeriment').click ->
    requeriment = $("#requeriment").val();
    script_id = $("#script_id").val();
    if requeriment != ''
      $.ajax
        type: 'POST'
        url: '/requirements'
        data: {requirement: {script_id: script_id, requirement: requeriment}},
        success: (data) ->
          $("#requeriment").val('');
          $("#requeriments_list table ").append("<tr> <td>" + requeriment + "</td></tr>");
        errors: (data) ->
          alert data

  $('#add_related_script').click ->
    related_script = $("#related_script").val();
    script_id = $("#script_id").val();
    console.log(related_script)
    if related_script != null
      $.ajax
        type: 'POST'
        url: '/related_scripts'
        data: {related_script: {script_id: script_id, related_script_id: related_script}},
        success: (data) ->
          $("#related_script").val('');
          $("#related_script_list table ").append("<tr> <td>" + data.description + "</td></tr>");
        errors: (data) ->
          alert data


