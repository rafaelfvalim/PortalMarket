// CodeMirror, copyright (c) by Marijn Haverbeke and others
!function(e){"object"==typeof exports&&"object"==typeof module?e(require("../../lib/codemirror")):"function"==typeof define&&define.amd?define(["../../lib/codemirror"],e):e(CodeMirror)}(function(e){"use strict";e.defineMode("apl",function(){var e={".":"innerProduct","\\":"scan","/":"reduce","\u233f":"reduce1Axis","\u2340":"scan1Axis","\xa8":"each","\u2363":"power"},n={"+":["conjugate","add"],"\u2212":["negate","subtract"],"\xd7":["signOf","multiply"],"\xf7":["reciprocal","divide"],"\u2308":["ceiling","greaterOf"],"\u230a":["floor","lesserOf"],"\u2223":["absolute","residue"],"\u2373":["indexGenerate","indexOf"],"?":["roll","deal"],"\u22c6":["exponentiate","toThePowerOf"],"\u235f":["naturalLog","logToTheBase"],"\u25cb":["piTimes","circularFuncs"],"!":["factorial","binomial"],"\u2339":["matrixInverse","matrixDivide"],"<":[null,"lessThan"],"\u2264":[null,"lessThanOrEqual"],"=":[null,"equals"],">":[null,"greaterThan"],"\u2265":[null,"greaterThanOrEqual"],"\u2260":[null,"notEqual"],"\u2261":["depth","match"],"\u2262":[null,"notMatch"],"\u2208":["enlist","membership"],"\u2377":[null,"find"],"\u222a":["unique","union"],"\u2229":[null,"intersection"],"\u223c":["not","without"],"\u2228":[null,"or"],"\u2227":[null,"and"],"\u2371":[null,"nor"],"\u2372":[null,"nand"],"\u2374":["shapeOf","reshape"],",":["ravel","catenate"],"\u236a":[null,"firstAxisCatenate"],"\u233d":["reverse","rotate"],"\u2296":["axis1Reverse","axis1Rotate"],"\u2349":["transpose",null],"\u2191":["first","take"],"\u2193":[null,"drop"],"\u2282":["enclose","partitionWithAxis"],"\u2283":["diclose","pick"],"\u2337":[null,"index"],"\u234b":["gradeUp",null],"\u2352":["gradeDown",null],"\u22a4":["encode",null],"\u22a5":["decode",null],"\u2355":["format","formatByExample"],"\u234e":["execute",null],"\u22a3":["stop","left"],"\u22a2":["pass","right"]},t=/[\.\/\u233f\u2340\xa8\u2363]/,r=/\u236c/,l=/[\+\u2212\xd7\xf7\u2308\u230a\u2223\u2373\?\u22c6\u235f\u25cb!\u2339<\u2264=>\u2265\u2260\u2261\u2262\u2208\u2377\u222a\u2229\u223c\u2228\u2227\u2371\u2372\u2374,\u236a\u233d\u2296\u2349\u2191\u2193\u2282\u2283\u2337\u234b\u2352\u22a4\u22a5\u2355\u234e\u22a3\u22a2]/,a=/\u2190/,i=/[\u235d#].*$/,o=function(e){var n;return n=!1,function(t){return n=t,t===e?"\\"===n:!0}};return{startState:function(){return{prev:!1,func:!1,op:!1,string:!1,escape:!1}},token:function(u,s){var c,p,d;return u.eatSpace()?null:(c=u.next(),'"'===c||"'"===c?(u.eatWhile(o(c)),u.next(),s.prev=!0,"string"):/[\[{\(]/.test(c)?(s.prev=!1,null):/[\]}\)]/.test(c)?(s.prev=!0,null):r.test(c)?(s.prev=!1,"niladic"):/[\xaf\d]/.test(c)?(s.func?(s.func=!1,s.prev=!1):s.prev=!0,u.eatWhile(/[\w\.]/),"number"):t.test(c)?"operator apl-"+e[c]:a.test(c)?"apl-arrow":l.test(c)?(p="apl-",null!=n[c]&&(p+=s.prev?n[c][1]:n[c][0]),s.func=!0,s.prev=!1,"function "+p):i.test(c)?(u.skipToEnd(),"comment"):"\u2218"===c&&"."===u.peek()?(u.next(),"function jot-dot"):(u.eatWhile(/[\w\$_]/),d=u.current(),s.prev=!0,"keyword"))}}}),e.defineMIME("text/apl","apl")});