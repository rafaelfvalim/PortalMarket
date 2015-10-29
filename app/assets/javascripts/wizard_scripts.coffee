# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
StatusEnum = {START: 'start', GENERATELIST: 'generate list', FINAL: 'final'};
valueChainStep = StatusEnum.START;
nivel = 1;
arrayLevels = [];

remove_breadcrumb = (e) ->
  $("#" + e).remove()

window.process_call_ajax = (id, e) ->
  $.ajax
    type: 'GET',
    url: '/process_modules/' + id + '/get_list_ajax.json'
    data:
      id: id
    success: (data) ->
      processListFactory($("#list_process_chain"), data, e)
    errors: (data) ->
      alert('error')

processListFactory = (root_element, data, element) ->
  selected = parseInt($(element).attr("data-level"), 10)
  last_selected = $(element).attr("id")
  $("#list_process_chain [data-level='" + selected + "'] #process_id").val(last_selected)
  $("#list_process_chain").scrollTo(element)
  clear_chain(selected)
  if ($.isEmptyObject(data))
    showFinalStep(root_element, last_selected);
    valueChainStep = StatusEnum.FINAL;
  else
    showList(root_element, data);
    valueChainStep = StatusEnum.GENERATELIST;

showFinalStep = (e, last_selected) ->
  process_module_id = last_selected
  if process_module_id == null || process_module_id == ''
    process_module_id = $("#process_id").val()
  div_container = $('<div class="col-xs-6 col-sm-4 col-md-3 col-md-2 value_chain">')
  div_container.attr("data-level", nivel)
  div_content = $('<div class ="finish_process">')
  submit_form = $('<input type="submit" value="Finish"  class="btn btn-success"/>')

  #  link_to = $('<a href="' + getFinalStepUrl(gon.action, process_module_id, gon.script_id) + '" class="btn btn-success">')
  #  link_to.text("Finish")
  #  link_to.attr("data-level", nivel)
  div_content.append(submit_form)
  div_container.append(div_content)
  nivel++
  arrayLevels.push(div_container)
  return e.append(div_container)

getFinalStepUrl = (action, process_module_id, script_id) ->
  if action == 'edit'
    return '/value_chains/create_ajax/' + process_module_id + '/' + script_id + '/edit'
  else
    return '/value_


chains/create_ajax/' + process_module_id + '/' + script_id + '/create'

showList = (e, data) ->
  divListContainer = $('<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3 ">')
  divListContainer.attr("data-level", nivel)
  divLisProcess = $('<div class="list_process">')
  divLisProcess.attr("data-level", nivel)
  divListProcessListGroup = $('<ul class="list-unstyled">')
  hidden_process_id = $('<input type="hidden" id="process_id" name="process[][id]">')

  $.each(data, (key, value) ->
    li = $("<li>")
    divListProcessListGroupButton = $('<a href="#">')
    divListProcessListGroupButton.text(value.description)
    divListProcessListGroupButton.attr("id", value.id)
    divListProcessListGroupButton.attr("data-level", nivel)
    divListProcessListGroupButton.attr("onclick", "process_call_ajax(" + value.id + ", this)")
    li.append(divListProcessListGroupButton)
    return divListProcessListGroup.append(li)
  )
  divLisProcess.append(divListProcessListGroup)
  divLisProcess.append(hidden_process_id)
  divListContainer.append(divLisProcess)
  nivel++
  arrayLevels.push(divListContainer)
  return $(e).append(divListContainer)

clear_chain = (selected) ->
  arrayLevels.forEach((element) ->
    data_level = parseInt($(element).attr("data-level"), 10)
    if (selected < data_level)
      $(element).remove()
  )

$ ->
  if $(".breadcrumb").length == 0
    $(".badge").text(0)
  else
    $(".badge").text($(".breadcrumb").length)

  if valueChainStep == StatusEnum.START
    process_call_ajax($("#process_id").val())

  $("#value_chain_process a").click (e) ->
    alert 'teste'
    clear_chain(1)

  setProgressBar = (tab) ->
    console.log(tab)
    switch tab
      when 'step1'
        $('#progressbar').width('0%')
      when 'step2'
        $('#progressbar').width('30%')
      when 'step3'
        $('#progressbar').width('50%')
      when 'step4'
        $('#progressbar').width('70%')
      when 'step5'
        $('#progressbar').width('100%')

  $('a[data-toggle="tab"]').click (e) ->
    tab = $(e.target).attr('href')
    setProgressBar tab.substring(1, tab.length)

  $('.next').click ->
    nextId = $(this).parents('.tab-pane').next().attr('id')
    setProgressBar nextId

    $('[href=#' + nextId + ']').tab 'show'
  return

  $('.first').click ->
    $('#myWizard a:first').tab 'show'
