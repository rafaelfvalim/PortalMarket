!function(e){"function"==typeof define&&define.amd?define(["jquery","../jquery.validate"],e):e(jQuery)}(function(e){e.extend(e.validator.messages,{required:"Polje je obavezno.",remote:"Sredite ovo polje.",email:"Unesite ispravnu i-mejl adresu",url:"Unesite ispravan URL.",date:"Unesite ispravan datum.",dateISO:"Unesite ispravan datum (ISO).",number:"Unesite ispravan broj.",digits:"Unesite samo cife.",creditcard:"Unesite ispravan broj kreditne kartice.",equalTo:"Unesite istu vrednost ponovo.",extension:"Unesite vrednost sa odgovaraju\u0107om ekstenzijom.",maxlength:e.validator.format("Unesite manje od {0} karaktera."),minlength:e.validator.format("Unesite barem {0} karaktera."),rangelength:e.validator.format("Unesite vrednost duga\u010dku izme\u0111u {0} i {1} karaktera."),range:e.validator.format("Unesite vrednost izme\u0111u {0} i {1}."),max:e.validator.format("Unesite vrednost manju ili jednaku {0}."),min:e.validator.format("Unesite vrednost ve\u0107u ili jednaku {0}.")})});