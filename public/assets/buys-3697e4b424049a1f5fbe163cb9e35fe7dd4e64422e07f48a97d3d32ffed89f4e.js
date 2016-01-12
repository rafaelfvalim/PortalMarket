(function() {
  $(function() {
    return $('#cart_workplace_attributes_organization_name').autocomplete({
      minLength: 2,
      source: function(request, response) {
        return $.ajax({
          url: '/buys/autocomplete_organization.json',
          dataType: 'json',
          data: request,
          success: function(data) {
            return response($.map(data, function(workplace) {
              return {
                label: workplace.organization_name,
                value: workplace.organization_name,
                id: workplace.id,
                system_number: workplace.system_number
              };
            }));
          }
        });
      },
      select: function(event, ui) {
        $("#cart_workplace_attributes_system_number").val(ui.item.system_number);
        return $("html, body").animate({
          scrollTop: 0
        }, "fast");
      }
    });
  });

}).call(this);
