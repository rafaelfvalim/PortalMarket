(function(){$(function(){return $(".input-group.date").datetimepicker({minDate:0,locale:"pt-br"}),$('#create_price_form input[type="text"]').tooltipster({trigger:"custom",onlyOne:!1,position:"right"}),$("#create_price_form").validate({rules:{".form-control.number":{number:!0},".form-control.money":{money:!0}},errorPlacement:function(t,e){return $(e).tooltipster("update",$(t).text()),$(e).tooltipster("show")},success:function(t,e){return $(e).tooltipster("hide")}})})}).call(this);