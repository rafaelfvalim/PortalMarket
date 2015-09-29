# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#value_chain_process a ").click (e) ->
    id = $("#process_id").val()
    if valueChainStep == StatusEnum.START
      process_call_ajax(id)


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
