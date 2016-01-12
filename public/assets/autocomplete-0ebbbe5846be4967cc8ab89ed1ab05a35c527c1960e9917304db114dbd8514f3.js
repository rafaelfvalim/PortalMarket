(function() {
  $(function() {
    var defaultVal;
    $('#requeriment').autocomplete({
      source: function(request, response) {
        return $.ajax({
          url: '/scripts/autocomplete_requeriment.json',
          dataType: 'json',
          data: request,
          success: function(data) {
            return response($.map(data, function(script) {
              return {
                label: script.name,
                value: script.name,
                id: script.id
              };
            }));
          }
        });
      },
      select: function(event, ui) {
        return $("#requirement_script_id_requirement").val(ui.item.id);
      },
      change: function(event, ui) {
        if (ui.item === null) {
          return $("#requirement_script_id_requirement").val('');
        }
      }
    });
    defaultVal = '';
    return $('#related_script').autocomplete({
      minLength: 2,
      source: function(request, response) {
        return $.ajax({
          url: '/scripts/autocomplete_related_script.json',
          dataType: 'json',
          data: request,
          success: function(data) {
            return response($.map(data, function(script) {
              return {
                label: script.name,
                value: script.name,
                id: script.id
              };
            }));
          }
        });
      },
      change: function(event, ui) {
        if (ui.item === null) {
          $("#related_script_script_id").val('');
          $("#related_script_related_script_id").val('');
          $("#related_script").val('');
          return alert('Please select a value from the list');
        }
      },
      select: function(event, ui) {
        return $("#related_script_related_script_id").val(ui.item.id);
      }
    });
  });

}).call(this);
