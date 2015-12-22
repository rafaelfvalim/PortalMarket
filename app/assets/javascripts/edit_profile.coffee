# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $('#edit_profile_form').validate
    ignore: ':hidden'
    rules:
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