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
      swal('error')

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
  divListContainer = $('<div class="col-md-3">')
  divListContainer.attr("data-level", nivel)

  divLisProcess = $('<div class="list-group">')
  divLisProcess.attr("data-level", nivel)
  divListProcessListGroup = $('<ul class="list-unstyled">')
  hidden_process_id = $('<input type="hidden" id="process_id" name="process[][id]">')

  $.each(data, (key, value) ->
    li = $("<li>")
    divListProcessListGroupButton = $('<a href="#">')
    divListProcessListGroupButton.text(value.description)
    divListProcessListGroupButton.attr("id", value.id)
    divListProcessListGroupButton.attr("data-level", nivel)
    divListProcessListGroupButton.attr("class", "list-group-item")
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

appendContent = (imageUrl, mediaId) ->
  ext = imageUrl.replace(/^.*\./, '');
  filename = imageUrl.replace(/^.*[\\\/]/, '')
  #  $('#media-contents').append ' <div class="col-lg-3">' + '<div class="thumbnail text-center"> <div class="icon"> <img src="/assets/file_types/file_' + ext + '.png" width="60" height="60"/> </div>  <div class="file-name"> ' + filename + ' </div>' + '<div class="caption">' + '<input id="media_contents_" name="media_contents[]" value="' + mediaId + '" type="checkbox">' + '</div>' + '</div></div>'
  $('#table_documents tr:last').after '<tr> <td><img src="/assets/file_types/file_' + ext + '.png" width="35" height="35"/></td><td>' + filename + '</td><td><input id="media_contents_" name="media_contents[]" value="' + mediaId + '" type="checkbox"></td></tr>'
  $('#delete').removeAttr 'disabled'
  $('#delete-all').removeAttr 'disabled'
  $('#no-media').html ''

$ ->
  if $('#media-dropzone').length
    mediaDropzone = new Dropzone('#media-dropzone')
    Dropzone.options.mediaDropzone = false
    mediaDropzone.options.acceptedFiles = '.jpeg,.jpg,.png,.gif,.pdf,.doc,.docx,.xls,.xlsx,.avi,.asf,.mov,.qt,.avchd,.flv,.swf,.mpg,.mp4,.wmv,.txt,.log'
    mediaDropzone.on 'complete', (files) ->
      _this = this
      if _this.getUploadingFiles().length == 0 and _this.getQueuedFiles().length == 0
        setTimeout (->
          $('#myModal').modal 'hide'
          acceptedFiles = _this.getAcceptedFiles()
          rejectedFiles = _this.getRejectedFiles()
          index = 0
          while index < acceptedFiles.length
            file = acceptedFiles[index]
            response = JSON.parse(file.xhr.response)
            appendContent response.file_name.url, response.id
            index++
          if acceptedFiles.length != 0
            console.log 'aceito' + acceptedFiles.length
            swal(
              'Perfeito!',
              acceptedFiles.length + ' arquivo(s) anexados com sucesso',
              'success'
            )
          if rejectedFiles.length != 0
            swal(
              'Erro!',
              rejectedFiles.length +' arquivo(s) com erro ao anexar',
                'error'
            )
          _this.removeAllFiles()
          return
        ), 2000
      return

  $("#requirement_requirement").maxlength
    events: []
    maxCharacters: 200
    status: true
    statusClass: 'status'
    statusText: 'letras restantes'
    notificationClass: 'notification'
    showAlert: true
    alertText: 'Você excedeu a quantidade de caracteres do campo!'
    slider: false

  $('#add_requisitos input[type="text"]').tooltipster
    trigger: 'custom'
    onlyOne: false

  $('#add_requisitos').validate
    errorPlacement: (error, element) ->
      lastError = $(element).data('lastError')
      newError = $(error).text()
      $(element).data 'lastError', newError
      if newError != '' and newError != lastError
        $(element).tooltipster 'content', newError
        $(element).tooltipster 'show'
    success: (label, element) ->
      $(element).tooltipster 'hide'
    ignore: ':hidden'
    rules:
      'requirement[requirement]':
        maxlength: 200
        minlength: 10


  if $(".breadcrumb").length == 0
    $("#process_badge").text(0)
  else
    $("#process_badge").text($(".breadcrumb").length)

  if $('#value_chain_process').length
    process_call_ajax($("#process_id").val())

  $("#value_chain_process a").click (e) ->
    clear_chain(1)

  setProgressBar = (tab) ->
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





