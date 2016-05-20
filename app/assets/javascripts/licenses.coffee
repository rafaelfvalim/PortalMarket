window.getDetailsFileName = (arquivo) ->
  swal 'Nome do arquivo:', arquivo, 'info'

window.getDetailsLicenseKey = (key) ->
  swal 'Licença:', key, 'info'

window.getDetails = (key, description, file_name, desistencia) ->
  $('.modal-body #description').text(description)
  $('.modal-body #key').text(key)
  $('.modal-body #file_name').text(file_name)
  $('.modal-body #desistencia').text(desistencia)
  $('#modal_license').modal()


$ ->
  $('#license-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#license-table').data('source')
    sPaginationType: 'full'
    bAutoWidth: true
#    columns: [{width: '5%' },{width: '5%' },{width: '5%' }, {width: '20%' }, {width: '10%' },{width: '20%' }]
    columnDefs: [{orderable: false, targets: [6, 7, 8]}]

