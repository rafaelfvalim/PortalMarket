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
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require bootstrap-sprockets
//= require nested_form_fields
//= require jquery-ui
//= require jquery-ui/autocomplete
//= require dataTables/jquery.dataTables
//= require jquery.scrollTo
//= require bootstrap-typeahead-rails
//= jquery.validate.localization/messages_pt_BR.js
//= require moment
//= require moment/pt-br.js
//= require bootstrap-datetimepicker
//= require jquery.tooltipster.min.js
//= require_tree .

var ready;
ready = function () {
    //alert delay de mensagem de erro
    alert_delay();
    //iniciar form singup form
    init_form_singup($("#singup_form input[type='radio']:checked").val());
    //validate singup form
    validate_form_singup();
    //before validation form submit
    before_action_singup_form();

};

$(document).ready(ready);

//message chat
//$(function () {
//    var faye_client = new Faye.Client('http://localhost:9292/faye');
//    faye_client.subscribe('/chat', function (data) {
//        eval(data);
//    });
//});

var alert_delay;
alert_delay = function () {
    $(".alert").delay(4000).slideUp(200, function () {
        $(this).alert('close');
    });
}

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

var init_form_singup;
init_form_singup = function (e) {
    before_action_singup_form
    if (e == 1) {
        contributor_fields_singup('show')
    } else {
        customer_fields_singup('show')
    }
}

var form_singup_member;
form_singup_member = function (e) {

    if (e == 'contributor') {
        customer_fields_singup('hide')
        contributor_fields_singup('show')
    }

    if (e == 'customer') {
        customer_fields_singup('show')
        contributor_fields_singup('hide')
    }
}

var customer_fields_singup;
customer_fields_singup = function (action) {
    if (action == 'show') {
        $("#cnpj").removeClass('hidden')
        $("#company_name").removeClass('hidden')
    }

    if (action == 'hide') {
        $("#cnpj").addClass('hidden')
        $("#user_member_attributes_cnpj").val("")
        $("#company_name").addClass('hidden')
        $("#user_member_attributes_company_name").val("")
    }
}

var contributor_fields_singup;
contributor_fields_singup = function (action) {
    if (action == 'show') {
        $("#cpf").removeClass('hidden')
        $("#select_bank").removeClass('hidden')
        $("#bank_cc").removeClass('hidden')
        $("#name").removeClass('hidden')
        $("#last_name").removeClass('hidden')
        $("#birthday").removeClass('hidden')
    }

    if (action == 'hide') {
        $("#cpf").addClass('hidden')
        $("#cpf_field").val("")
        $("#select_bank").addClass('hidden')
        $("#user_member_attributes_bank_id select").val("Please Select ...")
        $("#bank_cc").addClass('hidden')
        $("#user_member_attributes_bank_cc").val("")
        $("#name").addClass('hidden')
        $("#user_member_attributes_member_name").val("")
        $("#last_name").addClass('hidden')
        $("#user_member_attributes_member_last_name").val("")
        $("#birthday").addClass('hidden')
    }

}

var validate_form_singup;
validate_form_singup = function () {
    $("#singup_form").validate({
        ignore: ":hidden",
        rules: {
            "user[member_attributes][member_name]": {minlength: 5, required: true},
            "user[member_attributes][member_last_name]": {minlength: 5, required: true},
            "user[member_attributes][member_type_id]": {required: true},
            "user[member_attributes][cpf]": {cpfBR: true, required: true},
            "user[member_attributes][cnpj]": {cnpj: true, required: true},
            "user[member_attributes][bank_id]": {numbersOnly: true, required: true},
            "user[member_attributes][bank_ag]": {numbersOnly: true, required: true},
            "user[member_attributes][bank_cc]": {numbersOnly: true, required: true},
            "user[member_attributes][bank_cc_digit]": {numbersOnly: true, required: true},
            "user[member_attributes][company_name]": {required: true},
            "user[email]": {required: true},
            "user[password]": {
                required: true,
                minlength: 5
            },
            "user[password_confirmation]": {
                required: true,
                minlength: 5,
                equalTo: '[name="user[password]"]'
            },
        }
    });
}

var before_action_singup_form;
before_action_singup_form = function () {
    $('#singup_form').submit(function () {
        var user_name = $("#user_member_attributes_member_name").val();
        var company_name = $("#user_member_attributes_company_name").val();
        if (user_name != '') {
            $("#user_name").val(user_name);
        } else {
            $("#user_name").val(company_name);
        }
        return true;
    });
}



