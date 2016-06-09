# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.countNews = (id) ->
  $('#visited-' + id).text('Visited').toggleClass('label label-primary label label-success')
  $.ajax
    type: 'GET',
    url: '/publications/get_news_count.json'
    data:
      id: id
    success: (data) ->
     $('#count-new').text('')
     $('#count-new').text('News ' + data)
    errors: (data) ->
      swal "error on get count news"
$ ->
  $('#new_publication').validate
    ignore: ':hidden'
    rules:
      'folder[name]':
        required: true
      'publication[folder_id]':
        required: true
      'publication[view_group]':
        required: true
    error: (label) ->
      swal "Por favor selecione todos folder e view group"
      $(this).addClass 'error'
    errorPlacement: ->
      return false