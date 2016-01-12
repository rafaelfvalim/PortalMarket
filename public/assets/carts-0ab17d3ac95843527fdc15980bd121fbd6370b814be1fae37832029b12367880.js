(function() {
  $(function() {
    return $('#cart_form').validate({
      focusInvalid: false,
      rules: {
        'cart[workplace_attributes][system_number]': {
          minlength: 3,
          required: true
        },
        'cart[workplace_attributes][organization_name]': {
          minlength: 5,
          required: true
        }
      },
      invalidHandler: function(form, validator) {
        if (!validator.numberOfInvalids()) {
          return;
        }
        return $('html, body').animate({
          scrollTop: $(validator.errorList[0].element).offset().top - 300
        }, 800);
      }
    });
  });

}).call(this);
