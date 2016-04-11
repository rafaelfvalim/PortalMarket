# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#price-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#script-price-table').data('source')
    sPaginationType: 'full'
    columnDefs: [ { orderable: false, targets: [5,6,7] } ]

  $('#script-price-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#script-price-table').data('source')
    sPaginationType: 'full'
    bAutoWidth: true

  $('.input-group.date').datetimepicker({minDate: +0, locale: 'pt-br'});

  $('#create_price_form input[type="text"]').tooltipster({
    trigger: 'custom', # default is 'hover' which is no good here
    onlyOne: false, # allow multiple tips to be open at a time
    position: 'right'  # display the tips to the right of the element
  })
  $('#price_value').mask '###0,00', reverse: true
  $('#price_aggregate_percentage').mask('##0.0', {reverse: true});

#  $('#create_price_form').validate
#    rules:
#      ".form-control.number":
#        number: true
#      ".form-control.money":
#        number: true
#    errorPlacement: (error, element)->
#      $(element).tooltipster('update', $(error).text());
#      $(element).tooltipster('show');
#    success: (label, element) ->
#      $(element).tooltipster('hide');
