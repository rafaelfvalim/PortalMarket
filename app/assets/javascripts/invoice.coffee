# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#invoice-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#invoice-table').data('source')
    sPaginationType: 'full'
   # columnDefs: [ { orderable: false, targets: [1,2,3] } ]

