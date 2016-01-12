(function() {
  var StatusEnum, arrayLevels, clear_chain, getFinalStepUrl, nivel, processListFactory, remove_breadcrumb, showFinalStep, showList, valueChainStep;

  StatusEnum = {
    START: 'start',
    GENERATELIST: 'generate list',
    FINAL: 'final'
  };

  valueChainStep = StatusEnum.START;

  nivel = 1;

  arrayLevels = [];

  remove_breadcrumb = function(e) {
    return $("#" + e).remove();
  };

  window.process_call_ajax = function(id, e) {
    console.log("chamou o process modules");
    return $.ajax({
      type: 'GET',
      url: '/process_modules/' + id + '/get_list_ajax.json',
      data: {
        id: id
      },
      success: function(data) {
        return processListFactory($("#list_process_chain"), data, e);
      },
      errors: function(data) {
        return alert('error');
      }
    });
  };

  processListFactory = function(root_element, data, element) {
    var last_selected, selected;
    selected = parseInt($(element).attr("data-level"), 10);
    last_selected = $(element).attr("id");
    $("#list_process_chain [data-level='" + selected + "'] #process_id").val(last_selected);
    $("#list_process_chain").scrollTo(element);
    clear_chain(selected);
    if ($.isEmptyObject(data)) {
      showFinalStep(root_element, last_selected);
      return valueChainStep = StatusEnum.FINAL;
    } else {
      showList(root_element, data);
      return valueChainStep = StatusEnum.GENERATELIST;
    }
  };

  showFinalStep = function(e, last_selected) {
    var div_container, div_content, process_module_id, submit_form;
    process_module_id = last_selected;
    if (process_module_id === null || process_module_id === '') {
      process_module_id = $("#process_id").val();
    }
    div_container = $('<div class="col-xs-6 col-sm-4 col-md-3 col-md-2 value_chain">');
    div_container.attr("data-level", nivel);
    div_content = $('<div class ="finish_process">');
    submit_form = $('<input type="submit" value="Finish"  class="btn btn-success"/>');
    div_content.append(submit_form);
    div_container.append(div_content);
    nivel++;
    arrayLevels.push(div_container);
    return e.append(div_container);
  };

  getFinalStepUrl = function(action, process_module_id, script_id) {
    if (action === 'edit') {
      return '/value_chains/create_ajax/' + process_module_id + '/' + script_id + '/edit';
    } else {
      return '/value_ chains/create_ajax/' + process_module_id + '/' + script_id + '/create';
    }
  };

  showList = function(e, data) {
    var divLisProcess, divListContainer, divListProcessListGroup, hidden_process_id;
    divListContainer = $('<div class="col-md-3">');
    divListContainer.attr("data-level", nivel);
    divLisProcess = $('<div class="list-group">');
    divLisProcess.attr("data-level", nivel);
    divListProcessListGroup = $('<ul class="list-unstyled">');
    hidden_process_id = $('<input type="hidden" id="process_id" name="process[][id]">');
    $.each(data, function(key, value) {
      var divListProcessListGroupButton, li;
      li = $("<li>");
      divListProcessListGroupButton = $('<a href="#">');
      divListProcessListGroupButton.text(value.description);
      divListProcessListGroupButton.attr("id", value.id);
      divListProcessListGroupButton.attr("data-level", nivel);
      divListProcessListGroupButton.attr("class", "list-group-item");
      divListProcessListGroupButton.attr("onclick", "process_call_ajax(" + value.id + ", this)");
      li.append(divListProcessListGroupButton);
      return divListProcessListGroup.append(li);
    });
    divLisProcess.append(divListProcessListGroup);
    divLisProcess.append(hidden_process_id);
    divListContainer.append(divLisProcess);
    nivel++;
    arrayLevels.push(divListContainer);
    return $(e).append(divListContainer);
  };

  clear_chain = function(selected) {
    return arrayLevels.forEach(function(element) {
      var data_level;
      data_level = parseInt($(element).attr("data-level"), 10);
      if (selected < data_level) {
        return $(element).remove();
      }
    });
  };

  $(function() {
    var setProgressBar;
    if ($(".breadcrumb").length === 0) {
      $("#process_badge").text(0);
    } else {
      $("#process_badge").text($(".breadcrumb").length);
    }
    if ($('#value_chain_process').length) {
      process_call_ajax($("#process_id").val());
    }
    $("#value_chain_process a").click(function(e) {
      return clear_chain(1);
    });
    setProgressBar = function(tab) {
      switch (tab) {
        case 'step1':
          return $('#progressbar').width('0%');
        case 'step2':
          return $('#progressbar').width('30%');
        case 'step3':
          return $('#progressbar').width('50%');
        case 'step4':
          return $('#progressbar').width('70%');
        case 'step5':
          return $('#progressbar').width('100%');
      }
    };
    $('a[data-toggle="tab"]').click(function(e) {
      var tab;
      tab = $(e.target).attr('href');
      return setProgressBar(tab.substring(1, tab.length));
    });
    $('.next').click(function() {
      var nextId;
      nextId = $(this).parents('.tab-pane').next().attr('id');
      setProgressBar(nextId);
      return $('[href=#' + nextId + ']').tab('show');
    });
    return;
    return $('.first').click(function() {
      return $('#myWizard a:first').tab('show');
    });
  });

}).call(this);
