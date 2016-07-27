# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#script-category-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#script-category-table').data('source')
    sPaginationType: 'full'
    bAutoWidth: true
    columnDefs: [{orderable: false, targets: [3, 4]}
      {className: "td_description", targets: [2]}
      {with: "5%", targets: [1,3, 4]}
    ]
