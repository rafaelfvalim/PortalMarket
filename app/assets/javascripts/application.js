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

var ready;
ready = function() {
    $(".alert").delay(4000).slideUp(200, function() {
        $(this).alert('close');
    });

};

$(document).ready(ready);

//
//$(function () {
//    var faye_client = new Faye.Client('http://localhost:9292/faye');
//    faye_client.subscribe('/chat', function (data) {
//        eval(data);
//    });
//});

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
            showPleaseWait: function () {
                pleaseWaitDiv.modal();
            },
            hidePleaseWait: function () {
                pleaseWaitDiv.modal('hide');
            },

        };
    })();

var set_message_info;
set_message_info = function (e) {
    $("#info-message p").text();
    $("#info-message p").text(e);
}















