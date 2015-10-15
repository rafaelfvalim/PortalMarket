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
//= require bootstrap-typeahead-rails

//= require_tree .


// ValueChain view logic - process classification
//var StatusEnum = {START: 'start', GENERATELIST: 'generate list', FINAL: 'final'};
//var valueChainStep = StatusEnum.START;
//var process_call_ajax;
//var nivel = 1;
//var arrayLevels = [];
//
//var remove_breadcrumb;
//
//remove_breadcrumb = function (e) {
//    $("#" + e).remove();
//}
//
//process_call_ajax = function (id, e) {
//    var url;
//    url = '/process_modules/' + id + '/get_list_ajax.json';
//    return $.ajax({
//        type: 'GET',
//        url: url,
//        data: {
//            id: id
//        },
//        success: function (data) {
//            return processListFactory($("#list_process_chain"), data, e);
//        },
//        errors: function (data) {
//            return alert('error');
//        }
//    });
//};
//
//var processListFactory;
//processListFactory = function (root_element, data, element) {
//    var selected = parseInt($(element).attr("data-level"), 10);
//    var last_selected = $(element).attr("id");
//
//    $("#list_process_chain").scrollTo(element);
//    arrayLevels.forEach(function (element) {
//        var data_level = parseInt($(element).attr("data-level"), 10);
//        if (selected < data_level) {
//            $(element).remove();
//        }
//    })
//
//    if ($.isEmptyObject(data)) {
//        showFinalStep(root_element, last_selected);
//        valueChainStep = StatusEnum.FINAL;
//    } else {
//        showList(root_element, data);
//        valueChainStep = StatusEnum.GENERATELIST;
//    }
//
//};
//
//var showFinalStep;
//showFinalStep = function (e, last_selected) {
//    var div_container, link_to, div_content;
//    var process_module_id = last_selected;
//
//    if (process_module_id == null || process_module_id == '') {
//        process_module_id = $("#process_id").val()
//    }
//
//    div_container = $('<div class="col-xs-6 col-sm-4 col-md-3 col-md-2 value_chain">');
//    div_container.attr("data-level", nivel);
//    div_content = $('<div class ="finish_process">');
//    link_to = $('<a href="' + getFinalStepUrl(gon.action, process_module_id, gon.script_id) + '" class="btn btn-success">');
//    link_to.text("Finish");
//    link_to.attr("data-level", nivel);
//    div_content.append(link_to);
//    div_container.append(div_content);
//    nivel++;
//    arrayLevels.push(div_container);
//    return e.append(div_container);
//
//};
//
//var getFinalStepUrl;
//getFinalStepUrl = function (action, process_module_id, script_id) {
//    if (action == 'edit') {
//        return '/value_chains/create_ajax/' + process_module_id + '/' + script_id + '/edit';
//    } else {
//        return '/value_chains/create_ajax/' + process_module_id + '/' + script_id + '/create';
//    }
//
//}
//
//var showList;
//showList = function (e, data) {
//    var divLisProcess, divListContainer, divListProcessListGroup;
//    divListContainer = $('<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3 ">');
//    divListContainer.attr("data-level", nivel);
//    divLisProcess = $('<div class="list_process">');
//    divListProcessListGroup = $('<ul class="list-unstyled">');
//    $.each(data, function (key, value) {
//
//        var divListProcessListGroupButton;
//        var li = $("<li>")
//        divListProcessListGroupButton = $('<a href="#">');
//        divListProcessListGroupButton.text(value.description);
//        divListProcessListGroupButton.attr("id", value.id);
//        divListProcessListGroupButton.attr("data-level", nivel);
//        divListProcessListGroupButton.attr("onclick", "process_call_ajax(" + value.id + ", this)");
//        li.append(divListProcessListGroupButton);
//        return divListProcessListGroup.append(li);
//    });
//    divLisProcess.append(divListProcessListGroup);
//    divListContainer.append(divLisProcess);
//    nivel++;
//    arrayLevels.push(divListContainer);
//    return $(e).append(divListContainer);
//};

var scrollPosition;
scrollPosition = function (container, scrollTo) {
    container.animate({
        scrollTop: scrollTo.offset().top - container.offset().top + container.scrollTop()
    });

}

var codeStore;
codeStore = codeStore || (function () {
        var pleaseWaitDiv = $('<div class="modal fade bs-example-modal-sm" id="myPleaseWait" tabindex="-1"role="dialog" aria-hidden="true" data-backdrop="static"><div class="modal-dialog modal-sm"> <div class="modal-content"> <div class="modal-header"> <h4 class="modal-title"> <span class="glyphicon glyphicon-time"> </span>Please Wait </h4> </div> <div class="modal-body"> <div class="progress"> <div class="progress-bar progress-bar-infoprogress-bar-striped active"style="width: 100%"> </div> </div> </div> </div> </div> </div>');
        return {
            showPleaseWait: function() {
                pleaseWaitDiv.modal();
            },
            hidePleaseWait: function () {
                pleaseWaitDiv.modal('hide');
            },

        };
    })();















