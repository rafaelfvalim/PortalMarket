!function(d){"function"==typeof define&&define.amd?define(["jquery","../jquery.validate"],d):d(jQuery)}(function(d){d.extend(d.validator.methods,{date:function(d,t){return this.optional(t)||/^\d\d?\-\d\d?\-\d\d\d?\d?$/.test(d)},number:function(d,t){return this.optional(t)||/^-?(?:\d+|\d{1,3}(?:\.\d{3})+)(?:,\d+)?$/.test(d)}})});