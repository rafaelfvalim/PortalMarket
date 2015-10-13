# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
level = 0
arrayLevels = [];

window.searchProcess = (e) ->
  valor = $("option:selected", e).val();
  levelSelected = parseInt($(e).attr("data-level"), 10)
  arrayLevels.forEach (el) ->
    data_level = parseInt($(el).attr("data-level"), 10)
    if levelSelected < data_level
      $(el).remove()
  getProcessById(valor, $('#row_process'))


createComboChield = (data) ->
  level++
  div_col = $('<div class="col-md-3 text-center" data-level="' + parseInt(level, 10) + '">')
  div_form = $('<div class="form-group">')
  select = $('<select name="query_process" id="query_process" data-level="'+parseInt(level, 10)+'" class="form-control"  onchange="searchProcess(this)">')
  option_selected = $('<option selected>Select ...</option>')
  select.append(option_selected)
  $.map data, (val, id) ->
    option = $('<option value="' + val.id + '">' + val.description + '</option>')
    select.append(option)
  div_form.append(select)
  div_col.append(div_form)
  arrayLevels.push(div_col);
  return div_col

appendComboChield = (element, rootElement) ->
  rootElement.append(element)

getProcessById = (id, element) ->
  if !$.isEmptyObject(id)
    url = '/process_modules/' + id + '/get_list_ajax.json';
    $.ajax
      type: 'GET'
      url: url
      data:
        id: id
      success: (data) ->
        if !$.isEmptyObject(data)
          appendComboChield(createComboChield(data), element)
      errors: (data) ->
        alert data
  return

$ ->
  $('#submit_search').click ->

    $('#search_form').submit()
