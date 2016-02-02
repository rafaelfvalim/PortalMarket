var ready;
ready = function () {

    //alert delay de mensagem de erro
    alert_delay();

    $("[data-mask]").each(function (index, value) {
        var element;
        element = $(value);
        return element.mask($(value).data('mask'));
    });

    $("#singup_form input[type='radio']").click(function () {
        form_singup_member($(this).val());
    });


};

$(document).ready(ready);

//message chat
//$(function () {
//    var faye_client = new Faye.Client('http://localhost:9292/faye');
//    faye_client.subscribe('/chat', function (data) {
//        eval(data);
//    });
//});

//Delay close alert
var alert_delay;
alert_delay = function () {
    $(".alert").delay(7000).slideUp(200, function () {
        $(this).alert('close');
    });
}

var scrollPosition;
scrollPosition = function (container, scrollTo) {
    container.animate({
        scrollTop: scrollTo.offset().top - container.offset().top + container.scrollTop()
    });

}

var codeStore   ;
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










