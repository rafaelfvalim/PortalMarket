!function(a){"function"==typeof define&&define.amd?define(["jquery","../jquery.validate"],a):a(jQuery)}(function(a){a.extend(a.validator.messages,{required:"\u0426\u0435 \u043f\u043e\u043b\u0435 \u043d\u0435\u043e\u0431\u0445\u0456\u0434\u043d\u043e \u0437\u0430\u043f\u043e\u0432\u043d\u0438\u0442\u0438.",remote:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u043f\u0440\u0430\u0432\u0438\u043b\u044c\u043d\u0435 \u0437\u043d\u0430\u0447\u0435\u043d\u043d\u044f.",email:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u043a\u043e\u0440\u0435\u043a\u0442\u043d\u0443 \u0430\u0434\u0440\u0435\u0441\u0443 \u0435\u043b\u0435\u043a\u0442\u0440\u043e\u043d\u043d\u043e\u0457 \u043f\u043e\u0448\u0442\u0438.",url:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u043a\u043e\u0440\u0435\u043a\u0442\u043d\u0438\u0439 URL.",date:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u043a\u043e\u0440\u0435\u043a\u0442\u043d\u0443 \u0434\u0430\u0442\u0443.",dateISO:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u043a\u043e\u0440\u0435\u043a\u0442\u043d\u0443 \u0434\u0430\u0442\u0443 \u0443 \u0444\u043e\u0440\u043c\u0430\u0442\u0456 ISO.",number:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u0447\u0438\u0441\u043b\u043e.",digits:"\u0412\u0432\u043e\u0434\u0438\u0442\u0435 \u043f\u043e\u0442\u0440\u0456\u0431\u043d\u043e \u043b\u0438\u0448\u0435 \u0446\u0438\u0444\u0440\u0438.",creditcard:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u043f\u0440\u0430\u0432\u0438\u043b\u044c\u043d\u0438\u0439 \u043d\u043e\u043c\u0435\u0440 \u043a\u0440\u0435\u0434\u0438\u0442\u043d\u043e\u0457 \u043a\u0430\u0440\u0442\u0438.",equalTo:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u0442\u0430\u043a\u0435 \u0436 \u0437\u043d\u0430\u0447\u0435\u043d\u043d\u044f \u0449\u0435 \u0440\u0430\u0437.",extension:"\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0438\u0431\u0435\u0440\u0456\u0442\u044c \u0444\u0430\u0439\u043b \u0437 \u043f\u0440\u0430\u0432\u0438\u043b\u044c\u043d\u0438\u043c \u0440\u043e\u0437\u0448\u0438\u0440\u0435\u043d\u043d\u044f\u043c.",maxlength:a.validator.format("\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u043d\u0435 \u0431\u0456\u043b\u044c\u0448\u0435 {0} \u0441\u0438\u043c\u0432\u043e\u043b\u0456\u0432."),minlength:a.validator.format("\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u043d\u0435 \u043c\u0435\u043d\u0448\u0435 {0} \u0441\u0438\u043c\u0432\u043e\u043b\u0456\u0432."),rangelength:a.validator.format("\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u0437\u043d\u0430\u0447\u0435\u043d\u043d\u044f \u0434\u043e\u0432\u0436\u0438\u043d\u043e\u044e \u0432\u0456\u0434 {0} \u0434\u043e {1} \u0441\u0438\u043c\u0432\u043e\u043b\u0456\u0432."),range:a.validator.format("\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u0447\u0438\u0441\u043b\u043e \u0432\u0456\u0434 {0} \u0434\u043e {1}."),max:a.validator.format("\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u0447\u0438\u0441\u043b\u043e, \u043c\u0435\u043d\u0448\u0435 \u0430\u0431\u043e \u0440\u0456\u0432\u043d\u043e {0}."),min:a.validator.format("\u0411\u0443\u0434\u044c \u043b\u0430\u0441\u043a\u0430, \u0432\u0432\u0435\u0434\u0456\u0442\u044c \u0447\u0438\u0441\u043b\u043e, \u0431\u0456\u043b\u044c\u0448\u0435 \u0430\u0431\u043e \u0440\u0456\u0432\u043d\u043e {0}.")})});