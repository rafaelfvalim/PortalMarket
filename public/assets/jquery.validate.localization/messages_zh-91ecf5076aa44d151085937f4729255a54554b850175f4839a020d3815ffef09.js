!function(a){"function"==typeof define&&define.amd?define(["jquery","../jquery.validate"],a):a(jQuery)}(function(a){a.extend(a.validator.messages,{required:"\u5fc5\u987b\u586b\u5199",remote:"\u8bf7\u4fee\u6b63\u6b64\u680f\u4f4d",email:"\u8bf7\u8f93\u5165\u6709\u6548\u7684\u7535\u5b50\u90ae\u4ef6",url:"\u8bf7\u8f93\u5165\u6709\u6548\u7684\u7f51\u5740",date:"\u8bf7\u8f93\u5165\u6709\u6548\u7684\u65e5\u671f",dateISO:"\u8bf7\u8f93\u5165\u6709\u6548\u7684\u65e5\u671f (YYYY-MM-DD)",number:"\u8bf7\u8f93\u5165\u6b63\u786e\u7684\u6570\u5b57",digits:"\u53ea\u53ef\u8f93\u5165\u6570\u5b57",creditcard:"\u8bf7\u8f93\u5165\u6709\u6548\u7684\u4fe1\u7528\u5361\u53f7\u7801",equalTo:"\u4f60\u7684\u8f93\u5165\u4e0d\u76f8\u540c",extension:"\u8bf7\u8f93\u5165\u6709\u6548\u7684\u540e\u7f00",maxlength:a.validator.format("\u6700\u591a {0} \u4e2a\u5b57"),minlength:a.validator.format("\u6700\u5c11 {0} \u4e2a\u5b57"),rangelength:a.validator.format("\u8bf7\u8f93\u5165\u957f\u5ea6\u4e3a {0} \u81f3 {1} \u4e4b\u9593\u7684\u5b57\u4e32"),range:a.validator.format("\u8bf7\u8f93\u5165 {0} \u81f3 {1} \u4e4b\u95f4\u7684\u6570\u503c"),max:a.validator.format("\u8bf7\u8f93\u5165\u4e0d\u5927\u4e8e {0} \u7684\u6570\u503c"),min:a.validator.format("\u8bf7\u8f93\u5165\u4e0d\u5c0f\u4e8e {0} \u7684\u6570\u503c")})});