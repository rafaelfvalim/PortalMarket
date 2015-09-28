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
//= require_tree .

//Process list Ajax - Cadeia de valores
var process_call_ajax;
process_call_ajax = function (id) {
    var url;
    url = '/process_modules/' + id + '/get_list_ajax.json';
    return $.ajax({
        type: 'GET',
        url: url,
        data: {
            id: id
        },
        success: function (data) {
            return processListFactory($("#list_process_chain"), data);
        },
        errors: function (data) {
            return alert('error');
        }
    });
};

//Process list Ajax - Cadeia de valores
var processListFactory;
processListFactory = function (e, data) {
    var finish = $("#process").val()
    alert(finish);

    if ($.isEmptyObject(data)) {
        finishStep(e);
    } else {
        listMaker(e, data);
    }
};

var finishStep;
finishStep = function (e) {
    var div_container, link_to, image_link, div_caption, p, hidden_finish;
    div_container = $('<div class="col-xs-4 col-md-2" id="value_chain_process_finish">');
    link_to = $('<a href="#" class="thumbnail text-center" >');
    image_link = $('<img src="/assets/dummy.png">');
    div_caption = $('<div class="caption">');
    p = $('<p>Finish</p>');
    div_caption.append(p);
    hidden_finish = $('<input type="hidden" value="complete" id="process">');
    link_to.append(image_link);
    link_to.append(div_caption);
    div_container.append(hidden_finish)
    div_container.append(link_to);
    return e.append(div_container)
};

var listMaker;
listMaker = function (e, data) {
    var divLisProcess, divListContainer, divListProcessListGroup;
    divListContainer = $('<div class="col-xs-6 col-sm-4 col-md-3 col-lg-3 ">');
    divLisProcess = $('<div class="list_process">');
    divListProcessListGroup = $('<div class="list-group">');
    $.each(data, function (key, value) {
        var divListProcessListGroupButton;
        divListProcessListGroupButton = $('<a href="#" class="list-group-item">');
        divListProcessListGroupButton.text(value.description);
        divListProcessListGroupButton.attr("id", value.id);
        divListProcessListGroupButton.attr("onclick", "process_call_ajax(" + value.id + ")");
        return divListProcessListGroup.append(divListProcessListGroupButton);
    });
    divLisProcess.append(divListProcessListGroup);
    divListContainer.append(divLisProcess);
    return $(e).append(divListContainer);

};