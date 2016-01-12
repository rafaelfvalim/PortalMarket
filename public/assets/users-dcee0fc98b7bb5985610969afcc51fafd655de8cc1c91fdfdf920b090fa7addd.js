(function() {
  $(function() {
    return $('#master_user_form').validate({
      ignore: ':hidden',
      rules: {
        'user[member_attributes][cpf]': {
          cpfBR: true,
          required: true
        },
        'user[member_attributes][cnpj]': {
          cnpj: true,
          required: true
        }
      }
    });
  });

}).call(this);
