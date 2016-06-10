# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.form_singup_member = (e) ->
  console.log e.value
  if e.value == '1'
    customer_fields_singup 'hide'
    contributor_fields_singup 'show'
  if e.value == '2'
    customer_fields_singup 'show'
    contributor_fields_singup 'hide'
  if e.value == '4'
    customer_fields_singup 'show'
    contributor_fields_singup 'show'

customer_fields_singup = (action) ->
  if action == 'hide'
    $('#user_member_attributes_cnpj').val ''
    $('#user_member_attributes_company_name').val ''

contributor_fields_singup = (action) ->
  if action == 'show'
    $('#select_bank').removeClass 'hidden'
    $('#bank_cc').removeClass 'hidden'
    $('#birthday').removeClass 'hidden'

  if action == 'hide'
    $('#select_bank').addClass 'hidden'
    $('#user_member_attributes_bank_id select').val 'Please Select ...'
    $('#bank_cc').addClass 'hidden'
    $('#user_member_attributes_bank_cc').val ''
    $('#birthday').addClass 'hidden'

$ ->
  $('#singup_form').validate
    ignore: ':hidden'
    rules:
      'user[member_attributes][member_type_id]':
        required: true
      'user[member_attributes][cpf]':
        cpfBR: true
        required: true
      'user[member_attributes][cnpj]':
        cnpj: true
        required: true
      'user[member_attributes][bank_id]':
        numbersOnly: true
        required: true
      'user[member_attributes][bank_ag]':
        numbersOnly: true
        required: true
      'user[member_attributes][bank_cc]':
        numbersOnly: true
        required: true
      'user[member_attributes][bank_cc_digit]':
        numbersOnly: true
        required: true
      'user[email]':
        email: true
        required: true
