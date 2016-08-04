# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#landing-page-banner-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#landing-page-banner-table').data('source')
    sPaginationType: 'full'
    bAutoWidth: true
    columnDefs: [{orderable: false, targets: [1,2]}]