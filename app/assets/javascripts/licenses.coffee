$ ->
  $('#license-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#license-table').data('source')
    sPaginationType: 'full'
    bAutoWidth: true
    columnDefs: [{orderable: false, targets: [7,8]}]