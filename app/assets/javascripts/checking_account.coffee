# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#checking-account-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#checking-account-table').data('source')
    sPaginationType: 'full'
    bAutoWidth: true
    columnDefs: [{orderable: false, targets: [6, 7]}]