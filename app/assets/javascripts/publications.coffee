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
     alert('error on get count news')
$ ->
  $('#new_folder').validate
    ignore: ':hidden'
    rules:
      'folder[name]':
        required: true
    error: (label) ->
      $(this).addClass 'error'
      return
    errorPlacement: ->
      return false