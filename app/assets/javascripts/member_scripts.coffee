# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#member-script-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#member-script-table').data('source')
    sPaginationType: 'full'
    bAutoWidth: true
    columnDefs:[
      {orderable: false, targets: [6,7,8]}
    ]