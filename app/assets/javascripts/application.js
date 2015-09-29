// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require nested_form_fields
//= require jquery-ui
//= require jquery-ui/autocomplete
//= require dataTables/jquery.dataTables
//= require jquery.scrollTo
//= require_tree .


// ValueChain view logic - process classification
var StatusEnum = {START: 'start', GENERATELIST: 'generate list', FINAL: 'final'};
var valueChainStep = StatusEnum.START;
var process_call_ajax;
var nivel = 1;
var arrayLevels = [];

process_call_ajax = function (id, e) {
    var url;
    url = '/process_modules/' + id + '/get_list_ajax.json';
    return $.ajax({
        type: 'GET',
        url: url,
        data: {
            id: id
        },
        success: function (data) {
            return processListFactory($("#list_process_chain"), data, e);
        },
        errors: function (data) {
            return alert('error');
        }
    });
};

var processListFactory;
processListFactory = function (root_element, data, e) {
    var id = parseInt($(e).attr("id"), 10);
    $("#list_process_chain").scrollTo(e);

    arrayLevels.forEach(function (e) {
        var element_id = parseInt($(e).attr("id"), 10);
        if (id < element_id) {
          $(e).remove();
        }
    })

    if ($.isEmptyObject(data)) {
        showFinalStep(root_element);
        valueChainStep = StatusEnum.FINAL;
    }

    if (!$.isEmptyObject(data)) {
        showList(root_element, data);
        valueChainStep = StatusEnum.GENERATELIST;
    }

};

var showFinalStep;
showFinalStep = function (e) {
    var div_container, link_to, div_content;
    div_container = $('<div class="col-xs-6 col-sm-4 col-md-3 col-md-2 value_chain">');
    div_container.attr("id", nivel);
    div_content = $('<div class ="finish_process">');
    link_to = $('<a href="#" class="btn btn-success" >');
    link_to.text("Finish");
    div_content.append(link_to);
    div_container.append(div_content);
    nivel++;
    arrayLevels.push(div_container);
    return e.append(div_container);

};

var showList;
showList = function (e, data) {
    var divLisProcess, divListContainer, divListProcessListGroup;
    divListContainer = $('<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3 ">');
    divListContainer.attr("id", nivel);
    divLisProcess = $('<div class="list_process">');
    divListProcessListGroup = $('<ul class="list-unstyled">');
    $.each(data, function (key, value) {
        var divListProcessListGroupButton;
        var li = $("<li>")
        divListProcessListGroupButton = $('<a href="#">');
        divListProcessListGroupButton.text(value.description);
        divListProcessListGroupButton.attr("id", nivel);
        divListProcessListGroupButton.attr("onclick", "process_call_ajax(" + value.id + ", this)");
        li.append(divListProcessListGroupButton);
        return divListProcessListGroup.append(li);
    });
    divLisProcess.append(divListProcessListGroup);
    divListContainer.append(divLisProcess);
    nivel++;
    arrayLevels.push(divListContainer);
    return $(e).append(divListContainer);
};

var scrollPosition;
scrollPosition = function (container, scrollTo){
    container.animate({
        scrollTop: scrollTo.offset().top - container.offset().top + container.scrollTop()
    });

}

