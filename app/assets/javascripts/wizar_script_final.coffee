# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.percentage_participation = (e) ->
  enable_save_final_step
  sum = Number(0)
  $('#percent').find('input[type=text]').each ->
    sum += Number($(this).val())
    return
  if sum > Number(100.0)
    alert 'values \u200b\u200bshould be less than 100 %'
    $(e).val '0'
  else
    $(e).closest('form').submit()

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

window.enable_save_final_step = () ->
  total_percent = Number($('#total_percent').val())
  alert total_percent
  if total_percent == 100
    $('#save_final_step').attr('disbled', 'false')
  else
    $('#save_final_step').attr('disbled', 'true')
return

$ ->



