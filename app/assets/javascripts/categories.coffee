# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#category-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#category-table').data('source')
    sPaginationType: 'full'
    bAutoWidth: true
    columnDefs: [{orderable: false, targets: [3,4]}]