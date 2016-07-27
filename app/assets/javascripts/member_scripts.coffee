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
      {className: "td_description", targets: [1,2,3]}
      {with: "5%", targets: [1,3, 4]}
    ]
  $('#costumer-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#costumer-table').data('source')
    sPaginationType: 'full'
    bAutoWidth: true
