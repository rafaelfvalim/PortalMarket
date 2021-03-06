# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#invoice-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#invoice-table').data('source')
    sPaginationType: 'full'
    columnDefs: [
      {orderable: false, targets: [6, 7, 8]}
      {className: "td_description", targets: [1, 2, 3]}
      {with: "5%", targets: [1, 3, 4]}
    ]

  $('#form_end_buy').on 'submit', (e) ->
    if $('#agree').val() != 'yes'
      swal 'Atenção', 'Aceite os termos para finalizar', 'info'
      e.preventDefault()
    return

  $('#agreeButton, #disagreeButton').on 'click', ->
    console.log 'adasd'
    whichButton = $(this).attr('id')
    console.log whichButton
    if whichButton == 'agreeButton'
      $('#agree').val('yes')
      $("#icon_agree i").removeAttr('class');
      $("#icon_agree i").removeAttr('style');
      $("#icon_agree i").attr('class', 'fa fa-check ');
      $("#icon_agree i").attr('style', 'color:green');
    else
      $('#agree').val('')
      $("#icon_agree i").removeAttr('class');
      $("#icon_agree i").removeAttr('style');
      $("#icon_agree i").attr('class', 'fa fa-close ');
      $("#icon_agree i").attr('style', 'color:red');


