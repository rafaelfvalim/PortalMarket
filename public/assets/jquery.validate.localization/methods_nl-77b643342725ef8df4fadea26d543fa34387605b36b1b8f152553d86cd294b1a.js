!function(d){"function"==typeof define&&define.amd?define(["jquery","../jquery.validate"],d):d(jQuery)}(function(d){d.extend(d.validator.methods,{date:function(d,e){return this.optional(e)||/^\d\d?[\.\/\-]\d\d?[\.\/\-]\d\d\d?\d?$/.test(d)}})});