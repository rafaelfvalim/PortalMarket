# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
#  Previnir do backspace voltar a pagina
  $(document).on 'keydown', (event) ->
    if event.which == 8 and !$(event.target).is('input, textarea')
      event.preventDefault()
    return
  $('#user_address_attributes_zip_code').cep()
