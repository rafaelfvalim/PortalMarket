(function() {
  $(function() {
    $('.input-group.date').datetimepicker({
      minDate: +0,
      locale: 'pt-br'
    });
    $('#create_price_form input[type="text"]').tooltipster({
      trigger: 'custom',
      onlyOne: false,
      position: 'right'
    });
    return $('#create_price_form').validate({
      rules: {
        ".form-control.number": {
          number: true
        },
        ".form-control.money": {
          money: true
        }
      },
      errorPlacement: function(error, element) {
        $(element).tooltipster('update', $(error).text());
        return $(element).tooltipster('show');
      },
      success: function(label, element) {
        return $(element).tooltipster('hide');
      }
    });
  });

}).call(this);
