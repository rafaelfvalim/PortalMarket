(function() {
  var contributor_fields_singup, customer_fields_singup;

  window.form_singup_member = function(e) {
    if (e === '1') {
      customer_fields_singup('hide');
      contributor_fields_singup('show');
    }
    if (e === '2') {
      customer_fields_singup('show');
      return contributor_fields_singup('hide');
    }
  };

  customer_fields_singup = function(action) {
    if (action === 'show') {
      $('#company_name').removeClass('hidden');
    }
    if (action === 'hide') {
      $('#user_member_attributes_cnpj').val('');
      $('#company_name').addClass('hidden');
      return $('#user_member_attributes_company_name').val('');
    }
  };

  contributor_fields_singup = function(action) {
    if (action === 'show') {
      $('#select_bank').removeClass('hidden');
      $('#bank_cc').removeClass('hidden');
      $('#birthday').removeClass('hidden');
    }
    if (action === 'hide') {
      $('#select_bank').addClass('hidden');
      $('#user_member_attributes_bank_id select').val('Please Select ...');
      $('#bank_cc').addClass('hidden');
      $('#user_member_attributes_bank_cc').val('');
      return $('#birthday').addClass('hidden');
    }
  };

  $(function() {
    return $('#singup_form').validate({
      ignore: ':hidden',
      rules: {
        'user[member_attributes][cpf]': {
          cpfBR: true,
          required: true
        },
        'user[member_attributes][cnpj]': {
          cnpj: true,
          required: true
        },
        'user[member_attributes][bank_id]': {
          numbersOnly: true,
          required: true
        },
        'user[member_attributes][bank_ag]': {
          numbersOnly: true,
          required: true
        },
        'user[member_attributes][bank_cc]': {
          numbersOnly: true,
          required: true
        },
        'user[member_attributes][bank_cc_digit]': {
          numbersOnly: true,
          required: true
        },
        'user[email]': {
          email: true,
          required: true
        }
      }
    });
  });

}).call(this);
