# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('.input-group.date').datetimepicker({minDate: +0 , locale: 'pt-br' });

  $('#create_price_form input[type="text"]').tooltipster({
    trigger: 'custom', # default is 'hover' which is no good here
    onlyOne: false, # allow multiple tips to be open at a time
    position: 'right'  # display the tips to the right of the element
  })


  $('#create_price_form').validate
    rules:
      ".form-control.number":
        number: true
      ".form-control.money":
        money: true
    errorPlacement: (error, element)->
      $(element).tooltipster('update', $(error).text());
      $(element).tooltipster('show');
    success: (label, element) ->
      $(element).tooltipster('hide');



