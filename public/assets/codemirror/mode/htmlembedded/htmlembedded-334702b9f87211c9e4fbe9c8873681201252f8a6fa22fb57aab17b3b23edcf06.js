// CodeMirror, copyright (c) by Marijn Haverbeke and others
!function(t){"object"==typeof exports&&"object"==typeof module?t(require("../../lib/codemirror"),require("../htmlmixed/htmlmixed")):"function"==typeof define&&define.amd?define(["../../lib/codemirror","../htmlmixed/htmlmixed"],t):t(CodeMirror)}(function(t){"use strict";t.defineMode("htmlembedded",function(e,n){function i(t,e){return t.match(a,!1)?(e.token=o,r.token(t,e.scriptState)):d.token(t,e.htmlState)}function o(t,e){return t.match(c,!1)?(e.token=i,d.token(t,e.htmlState)):r.token(t,e.scriptState)}var r,d,a=n.scriptStartRegex||/^<%/i,c=n.scriptEndRegex||/^%>/i;return{startState:function(){return r=r||t.getMode(e,n.scriptingModeSpec),d=d||t.getMode(e,"htmlmixed"),{token:n.startOpen?o:i,htmlState:t.startState(d),scriptState:t.startState(r)}},token:function(t,e){return e.token(t,e)},indent:function(t,e){return t.token==i?d.indent(t.htmlState,e):r.indent?r.indent(t.scriptState,e):void 0},copyState:function(e){return{token:e.token,htmlState:t.copyState(d,e.htmlState),scriptState:t.copyState(r,e.scriptState)}},innerMode:function(t){return t.token==o?{state:t.scriptState,mode:r}:{state:t.htmlState,mode:d}}}},"htmlmixed"),t.defineMIME("application/x-ejs",{name:"htmlembedded",scriptingModeSpec:"javascript"}),t.defineMIME("application/x-aspx",{name:"htmlembedded",scriptingModeSpec:"text/x-csharp"}),t.defineMIME("application/x-jsp",{name:"htmlembedded",scriptingModeSpec:"text/x-java"}),t.defineMIME("application/x-erb",{name:"htmlembedded",scriptingModeSpec:"ruby"})});