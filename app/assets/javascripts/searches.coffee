# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

level = 0
arrayLevels = [];

window.searchProcess = (e) ->
  valor = $("option:selected", e).val();
  text = $("option:selected", e).text();
  levelSelected = parseInt($(e).attr("data-level"), 10)
  arrayLevels.forEach (el) ->
    data_level = parseInt($(el).attr("data-level"), 10)
    if levelSelected < data_level
      $(el).remove()

  $("#process_description_selected").val(text)
  getProcessById(valor, $('#row_process'))


createComboChield = (data) ->
  level++
  div_col = $('<div class="col-md-3 text-center" data-level="' + parseInt(level, 10) + '">')
  div_form = $('<div class="form-group">')
  select = $('<select name="query_process" id="query_process" data-level="' + parseInt(level,
      10) + '" class="form-control"  onchange="searchProcess(this)">')
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
  $(rootElement).scrollTo(element);

getProcessById = (id, element) ->
  console.log(id)
  if !$.isEmptyObject(id)
    url = '/process_modules/' + id + '/get_list_ajax.json'
    $.ajax
      type: 'GET'
      url: url
      data:
        id: id
      success: (data) ->
        if !$.isEmptyObject(data)
          appendComboChield(createComboChield(data), element)
      errors: (data) ->
        swal 'erro' + data
clearFilters = ->
  arrayLevels.forEach (el) ->
    data_level = parseInt($(el).attr("data-level"), 10)
    if 0 < data_level
      $(el).remove()
    $('#query_process').val('');
  $('#process_description_selected').val("")


$ ->
  $('.footable').footable();

  $("#link_show_process_filters").click () ->
    if $("#link_show_process_filters i").hasClass("fa fa-plus")
      $("#link_show_process_filters i").removeClass("fa fa-plus")
      $("#link_show_process_filters i").addClass("fa fa-minus")
    else
      $("#link_show_process_filters i").removeClass("fa fa-minus")
      $("#link_show_process_filters i").addClass("fa fa-plus")
      clearFilters()
    return

  $("#clear_filters").click () ->
    clearFilters()
    return

