(function() {
  var appendComboChield, arrayLevels, clearFilters, createComboChield, getProcessById, level;

  level = 0;

  arrayLevels = [];

  window.searchProcess = function(e) {
    var levelSelected, text, valor;
    valor = $("option:selected", e).val();
    text = $("option:selected", e).text();
    levelSelected = parseInt($(e).attr("data-level"), 10);
    arrayLevels.forEach(function(el) {
      var data_level;
      data_level = parseInt($(el).attr("data-level"), 10);
      if (levelSelected < data_level) {
        return $(el).remove();
      }
    });
    $("#process_description_selected").val(text);
    return getProcessById(valor, $('#row_process'));
  };

  createComboChield = function(data) {
    var div_col, div_form, option_selected, select;
    level++;
    div_col = $('<div class="col-md-3 text-center" data-level="' + parseInt(level, 10) + '">');
    div_form = $('<div class="form-group">');
    select = $('<select name="query_process" id="query_process" data-level="' + parseInt(level, 10) + '" class="form-control"  onchange="searchProcess(this)">');
    option_selected = $('<option selected>Select ...</option>');
    select.append(option_selected);
    $.map(data, function(val, id) {
      var option;
      option = $('<option value="' + val.id + '">' + val.description + '</option>');
      return select.append(option);
    });
    div_form.append(select);
    div_col.append(div_form);
    arrayLevels.push(div_col);
    return div_col;
  };

  appendComboChield = function(element, rootElement) {
    rootElement.append(element);
    return $(rootElement).scrollTo(element);
  };

  getProcessById = function(id, element) {
    var url;
    console.log(id);
    if (!$.isEmptyObject(id)) {
      url = '/process_modules/' + id + '/get_list_ajax.json';
      return $.ajax({
        type: 'GET',
        url: url,
        data: {
          id: id
        },
        success: function(data) {
          if (!$.isEmptyObject(data)) {
            return appendComboChield(createComboChield(data), element);
          }
        },
        errors: function(data) {
          return alert('erro' + data);
        }
      });
    }
  };

  clearFilters = function() {
    arrayLevels.forEach(function(el) {
      var data_level;
      data_level = parseInt($(el).attr("data-level"), 10);
      if (0 < data_level) {
        $(el).remove();
      }
      return $('#query_process').val('');
    });
    return $('#process_description_selected').val("");
  };

  $(function() {
    $("#link_show_process_filters").click(function() {
      if ($("#link_show_process_filters i").hasClass("fa fa-plus")) {
        $("#link_show_process_filters i").removeClass("fa fa-plus");
        return $("#link_show_process_filters i").addClass("fa fa-minus");
      } else {
        $("#link_show_process_filters i").removeClass("fa fa-minus");
        $("#link_show_process_filters i").addClass("fa fa-plus");
        return clearFilters();
      }
    });
    return $("#clear_filters").click(function() {
      return clearFilters();
    });
  });

}).call(this);
