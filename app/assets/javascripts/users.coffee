# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#master_user_form').validate
    ignore: ':hidden'
    rules:
      'user[member_attributes][cpf]':
        cpfBR: true
        required: true
      'user[member_attributes][cnpj]':
        cnpj: true
        required: true
  $('#master-user-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#master-user-table').data('source')
    sPaginationType: 'full'
    columnDefs: [ { orderable: false, targets: [6,7] } ]