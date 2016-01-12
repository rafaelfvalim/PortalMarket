(function() {
  window.percentage_participation = function(e) {
    enable_save_final_step;
    var sum;
    sum = Number(0);
    $('#percent').find('input[type=text]').each(function() {
      sum += Number($(this).val());
    });
    if (sum > Number(100.0)) {
      alert('values \u200b\u200bshould be less than 100 %');
      $(e).val('0');
    } else {
      $(e).closest('form').submit();
    }
  };

  window.enable_save_final_step = function() {
    var total_percent;
    total_percent = Number($('#total_percent').val());
    alert(total_percent);
    if (total_percent === 100) {
      return $('#save_final_step').attr('disbled', 'false');
    } else {
      return $('#save_final_step').attr('disbled', 'true');
    }
  };

  return;

  $(function() {});

}).call(this);
