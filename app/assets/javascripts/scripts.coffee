# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
#  Remover rows jsquery
  @remove_table_row = (tr) ->
    $(tr).closest("tr").remove();

# Adiociona requerimentos
  $('#add_requeriment').click ->
    requeriment = $("#requeriment").val();
    script_id = $("#script_id").val();
    if requeriment != ''
      $.ajax
        type: 'POST'
        url: '/requirements'
        data: {requirement: {script_id: script_id, requirement: requeriment}},
        success: (data) ->
          remove_button = '<a class="btn btn-info" onclick="remove_table_row(this)" data-remote="true" rel="nofollow" data-method="delete" href="/requirements/'+data.id+'">Destroy</a>';
          hidden_tag = '<input type="hidden" value='+data.id+'>';
          table_row = "<tr><td>"+requeriment+"</td><td>"+remove_button+"</td> </tr>";
          $("#requeriment").val('');
          $("#requeriments_list table").prepend( table_row + hidden_tag);
        errors: (data) ->
          alert data

  #  Autocomplete normal
  $('#requeriment').autocomplete source: '/scripts/autocomplete_requeriment.json'

  # Adicionar related scripts ajax
  $('#add_related_script').click ->
    related_script = $("#related_script").val();
    related_script_id = $("#related_script_id").val();
    script_id = $("#script_id").val();
    if related_script != null
      $.ajax
        type: 'POST'
        url: '/related_scripts'
        data: {related_script: {script_id: script_id, related_script_id: related_script_id}},
        success: (data) ->
          $("#related_script").val('');
         # $("#related_script_list table ").append("<tr> <td>" + data.description + "</td></tr>");
          $("#related_script_list table ").html(data);
        errors: (data) ->
          alert data


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
            label: script.description
            value: script.description
            id: script.id
          )
      )
    change:(event , ui) ->
      if ui.item == null
        $("#related_script_id").val('');
        $("#related_script").val('');
        alert 'Please select a value from the list'

    select: (event, ui) ->
      $("#related_script_id").val(ui.item.id);

#    focus: (event , ui) ->
#      console.log(ui)
#      if ui != null
#        defaultVal = ui.item.label;
#      else
#        defaultVal = ''
#
#    close:(event , ui) ->
#      $("#related_script").val(defaultVal);


