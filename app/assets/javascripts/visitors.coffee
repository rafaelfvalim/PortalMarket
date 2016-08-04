$ ->
  $("#new_landing_page_contact").validate
    rules:
      'landing_page_contact[name]':
        required: true
        minlength: 5
      'landing_page_contact[email]':
        required: true
        email: true
      'landing_page_contact[phone]':
        numbersOnly: true
        minlength: 10
      'landing_page_contact[cellphone]':
        numbersOnly: true
        minlength: 11
      'landing_page_contact[area]':
        required: true
      'landing_page_contact[industy_id]':
        required: true
      'landing_page_contact[suggestion]':
        required: true
        minlength: 5
