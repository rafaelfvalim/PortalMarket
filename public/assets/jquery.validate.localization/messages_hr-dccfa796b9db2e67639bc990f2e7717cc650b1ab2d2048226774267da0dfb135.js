!function(e){"function"==typeof define&&define.amd?define(["jquery","../jquery.validate"],e):e(jQuery)}(function(e){e.extend(e.validator.messages,{required:"Ovo polje je obavezno.",remote:"Ovo polje treba popraviti.",email:"Unesite ispravnu e-mail adresu.",url:"Unesite ispravan URL.",date:"Unesite ispravan datum.",dateISO:"Unesite ispravan datum (ISO).",number:"Unesite ispravan broj.",digits:"Unesite samo brojeve.",creditcard:"Unesite ispravan broj kreditne kartice.",equalTo:"Unesite ponovo istu vrijednost.",extension:"Unesite vrijednost sa ispravnom ekstenzijom.",maxlength:e.validator.format("Maksimalni broj znakova je {0} ."),minlength:e.validator.format("Minimalni broj znakova je {0} ."),rangelength:e.validator.format("Unesite vrijednost izme\u0111u {0} i {1} znakova."),range:e.validator.format("Unesite vrijednost izme\u0111u {0} i {1}."),max:e.validator.format("Unesite vrijednost manju ili jednaku {0}."),min:e.validator.format("Unesite vrijednost ve\u0107u ili jednaku {0}.")})});