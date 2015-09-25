# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.thumbnail').click (e) ->
    $('.row_panel_build').hide 'drop', ->
      step = $('#process input').val()
      if step == 'step1'
        $('#accordion').hide 'clip', ->
          $('.row_panel_process').show 'drop', ->
            $('#process input').val('step2')
            return false
      if step == 'step2'
        $('.list_process').show 'fast'

    e.preventDefault()
  return false

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


