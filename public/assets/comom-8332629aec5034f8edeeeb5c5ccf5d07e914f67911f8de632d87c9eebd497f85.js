var ready;ready=function(){alert_delay(),$("[data-mask]").each(function(a,e){var o;return o=$(e),o.mask($(e).data("mask"))}),$("#singup_form input[type='radio']").click(function(){form_singup_member($(this).val())})},$(document).ready(ready);var alert_delay;alert_delay=function(){$(".alert").delay(7e3).slideUp(200,function(){$(this).alert("close")})};var scrollPosition;scrollPosition=function(a,e){a.animate({scrollTop:e.offset().top-a.offset().top+a.scrollTop()})};var codeStore;codeStore=codeStore||function(){var a=$('<div class="modal fade bs-example-modal-sm" id="myPleaseWait" tabindex="-1"role="dialog" aria-hidden="true" data-backdrop="static"><div class="modal-dialog modal-sm"> <div class="modal-content"> <div class="modal-header"> <h4 class="modal-title"> <span class="glyphicon glyphicon-time"> </span>Please Wait </h4> </div> <div class="modal-body"> <div class="progress"> <div class="progress-bar progress-bar-infoprogress-bar-striped active"style="width: 100%"> </div> </div> </div> </div> </div> </div>');return{showPleaseWait:function(){a.modal()},hidePleaseWait:function(){a.modal("hide")}}}();