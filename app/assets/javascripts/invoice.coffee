# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#invoice-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#invoice-table').data('source')
    sPaginationType: 'full'

  $('#form_end_buy').on 'submit', (e) ->
    if $('#agree').val() != 'yes'
      bootbox.alert 'Por favor aceite os termos para finalizar'
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


