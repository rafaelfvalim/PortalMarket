# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('body').on 'click', '#participation .pagination a', (e) ->
    e.preventDefault()
    $.getScript @href
    return false


window.final_validations = () ->
  if $('#total_percent').text() != '100.0'
    $("#dialog_percent").dialog();
    $('#modal-percent').modal('show')
    $(window).scrollTop($('#tab-0').offset().top);
    event.preventDefault();
  return false;

window.percentage_participation = (e) ->
  enable_save_final_step
  sum = Number(0)
  $('#percent').find('input[type=text]').each ->
    sum += Number($(this).val())
    return
  if sum > Number(100.0)
    swal 'values \u200b\u200bshould be less than 100 %'
    $(e).val '0'
  else
    $(e).closest('form').submit()

  return

window.enable_save_final_step = () ->
  total_percent = Number($('#total_percent').val())
  swal total_percent
  if total_percent == 100
    $('#save_final_step').attr('disbled', 'false')
  else
    $('#save_final_step').attr('disbled', 'true')
return

#window.equalize_percentual = ()->
#  i = 0
#  $('#percent').find('input[type=text]').each ->
#    i++
#    return
#  console.log i
#  div = 100.0 / i
#
#  $('#percent').find('input[type=text]').each ->
#    $(this).val(div)
#    $(this).closest('form').submit()
#    return
#return








