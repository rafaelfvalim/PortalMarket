!function(){function t(t){var n=t.match(/(\d+).(\d+).(\d+)/i);if(null==n||n.length<4)return null;var u=moment();return u.utc().year(n[1]),u.utc().month(n[2]),u.utc().date(n[3]),u}function n(t,n){if(null==t||!t.isValid())return n.val(""),null;var u=moment(n.val());return u.isValid()?(u.utc().year(t.utc().year()),u.utc().month(t.utc().month()),u.utc().date(t.utc().date())):u=t,n.val(u.utc().format()),u}function u(t){var n=t.match(/(\d+)(?::(\d\d))?\s*(p?)/i);if(null==n||n.length<4)return null;var u=moment(),e=parseInt(n[1]);return 12!=e||n[3]?n[3]&&(e+=12>e?12:0):e=0,u.utc().hour(e),u.utc().minute(n[2]),u}function e(t,n){if(null==t||!t.isValid())return n.val(""),null;var u=moment(n.val());return u.isValid()?(u.utc().hour(t.utc().hour()),u.utc().minute(t.utc().minute())):u=t,n.val(u.utc().format()),u}var i=function(i){var r=$("."+i+".datetime-attribute"),a=r.find("input#"+i+"[type=hidden]"),l=r.find("#"+i+"-date"),o=r.find("#"+i+"-time"),c=moment(a.val());""==a.val()&&(c=null);var m=function(){var u=t(l.val());return n(u,a),u},d=function(){var t=u(o.val());return e(t,a),t};new Pikaday({field:$("#"+i+"-date")[0],onSelect:m});$("#"+i+"-time").clockpicker({autoclose:!0,donetext:"Done",twelvehour:!0,afterDone:d}),null!=c&&o.val(c.utc().format("hh:mmA")),r.closest("form").submit(function(t){t.preventDefault(),d(),m(),t.target.submit()})};null==window.Upmin&&(window.Upmin={}),null==window.Upmin.Attributes&&(window.Upmin.Attributes={}),window.Upmin.Attributes.DateTime=i}();