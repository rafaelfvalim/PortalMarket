/* Chartist.js 0.8.3
 * Copyright © 2015 Gion Kunz
 * Free to use under the WTFPL license.
 * http://www.wtfpl.net/
 */


!function(a,b){"function"==typeof define&&define.amd?define([],function(){return a.Chartist=b()}):"object"==typeof exports?module.exports=b():a.Chartist=b()}(this,function(){var a={version:"0.8.3"};return function(a,b,c){"use strict";c.noop=function(a){return a},c.alphaNumerate=function(a){return String.fromCharCode(97+a%26)},c.extend=function(a){a=a||{};var b=Array.prototype.slice.call(arguments,1);return b.forEach(function(b){for(var d in b)"object"!=typeof b[d]||null===b[d]||b[d]instanceof Array?a[d]=b[d]:a[d]=c.extend({},a[d],b[d])}),a},c.replaceAll=function(a,b,c){return a.replace(new RegExp(b,"g"),c)},c.stripUnit=function(a){return"string"==typeof a&&(a=a.replace(/[^0-9\+-\.]/g,"")),+a},c.ensureUnit=function(a,b){return"number"==typeof a&&(a+=b),a},c.querySelector=function(a){return a instanceof Node?a:b.querySelector(a)},c.times=function(a){return Array.apply(null,new Array(a))},c.sum=function(a,b){return a+(b?b:0)},c.mapMultiply=function(a){return function(b){return b*a}},c.mapAdd=function(a){return function(b){return b+a}},c.serialMap=function(a,b){var d=[],e=Math.max.apply(null,a.map(function(a){return a.length}));return c.times(e).forEach(function(c,e){var f=a.map(function(a){return a[e]});d[e]=b.apply(null,f)}),d},c.roundWithPrecision=function(a,b){var d=Math.pow(10,b||c.precision);return Math.round(a*d)/d},c.precision=8,c.escapingMap={"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#039;"},c.serialize=function(a){return null===a||void 0===a?a:("number"==typeof a?a=""+a:"object"==typeof a&&(a=JSON.stringify({data:a})),Object.keys(c.escapingMap).reduce(function(a,b){return c.replaceAll(a,b,c.escapingMap[b])},a))},c.deserialize=function(a){if("string"!=typeof a)return a;a=Object.keys(c.escapingMap).reduce(function(a,b){return c.replaceAll(a,c.escapingMap[b],b)},a);try{a=JSON.parse(a),a=void 0!==a.data?a.data:a}catch(b){}return a},c.createSvg=function(a,b,d,e){var f;return b=b||"100%",d=d||"100%",Array.prototype.slice.call(a.querySelectorAll("svg")).filter(function(a){return a.getAttribute(c.xmlNs.qualifiedName)}).forEach(function(b){a.removeChild(b)}),f=new c.Svg("svg").attr({width:b,height:d}).addClass(e).attr({style:"width: "+b+"; height: "+d+";"}),a.appendChild(f._node),f},c.reverseData=function(a){a.labels.reverse(),a.series.reverse();for(var b=0;b<a.series.length;b++)"object"==typeof a.series[b]&&void 0!==a.series[b].data?a.series[b].data.reverse():a.series[b]instanceof Array&&a.series[b].reverse()},c.getDataArray=function(a,b){function d(a){return void 0===a||null===a||"number"==typeof a&&isNaN(a)?void 0:(a.data||a)instanceof Array?(a.data||a).map(d):a.hasOwnProperty("value")?d(a.value):+a}return(b&&!a.reversed||!b&&a.reversed)&&(c.reverseData(a),a.reversed=!a.reversed),a.series.map(d)},c.normalizePadding=function(a,b){return b=b||0,"number"==typeof a?{top:a,right:a,bottom:a,left:a}:{top:"number"==typeof a.top?a.top:b,right:"number"==typeof a.right?a.right:b,bottom:"number"==typeof a.bottom?a.bottom:b,left:"number"==typeof a.left?a.left:b}},c.normalizeDataArray=function(a,b){for(var c=0;c<a.length;c++)if(a[c].length!==b)for(var d=a[c].length;b>d;d++)a[c][d]=void 0;return a},c.getMetaData=function(a,b){var d=a.data?a.data[b]:a[b];return d?c.serialize(d.meta):void 0},c.orderOfMagnitude=function(a){return Math.floor(Math.log(Math.abs(a))/Math.LN10)},c.projectLength=function(a,b,c){return b/c.range*a},c.getAvailableHeight=function(a,b){return Math.max((c.stripUnit(b.height)||a.height())-(b.chartPadding.top+b.chartPadding.bottom)-b.axisX.offset,0)},c.getHighLow=function(a,b){function c(a){if(a instanceof Array)for(var b=0;b<a.length;b++)c(a[b]);else e&&a>d.high&&(d.high=a),f&&a<d.low&&(d.low=a)}var d={high:void 0===b.high?-Number.MAX_VALUE:+b.high,low:void 0===b.low?Number.MAX_VALUE:+b.low},e=void 0===b.high,f=void 0===b.low;return c(a),d.high<=d.low&&(0===d.low?d.high=1:d.low<0?d.high=0:d.low=0),d},c.rho=function(a){function b(a,c){return a%c===0?c:b(c,a%c)}function c(a){return a*a+1}if(1===a)return a;var d,e=2,f=2;if(a%2===0)return 2;do e=c(e)%a,f=c(c(f))%a,d=b(Math.abs(e-f),a);while(1===d);return d},c.getBounds=function(a,b,d,e,f){var g,h,i,j={high:b.high,low:b.low};(e||0===e)&&(j.high=Math.max(e,j.high),j.low=Math.min(e,j.low)),j.valueRange=j.high-j.low,j.oom=c.orderOfMagnitude(j.valueRange),j.step=Math.pow(10,j.oom),j.min=Math.floor(j.low/j.step)*j.step,j.max=Math.ceil(j.high/j.step)*j.step,j.range=j.max-j.min,j.numberOfSteps=Math.round(j.range/j.step);var k=c.projectLength(a,j.step,j),l=d>k,m=f?c.rho(j.range):0;if(f&&c.projectLength(a,1,j)>=d)j.step=1;else if(f&&m<j.step&&c.projectLength(a,m,j)>=d)j.step=m;else for(;;)if(l&&c.projectLength(a,j.step,j)<=d)j.step*=2;else{if(l||!(c.projectLength(a,j.step/2,j)>=d))break;if(j.step/=2,f&&j.step%1!==0){j.step*=2;break}}for(h=j.min,i=j.max;h+j.step<=j.low;)h+=j.step;for(;i-j.step>=j.high;)i-=j.step;for(j.min=h,j.max=i,j.range=j.max-j.min,j.values=[],g=j.min;g<=j.max;g+=j.step)j.values.push(c.roundWithPrecision(g));return j},c.polarToCartesian=function(a,b,c,d){var e=(d-90)*Math.PI/180;return{x:a+c*Math.cos(e),y:b+c*Math.sin(e)}},c.createChartRect=function(a,b,d){var e=!(!b.axisX&&!b.axisY),f=e?b.axisY.offset:0,g=e?b.axisX.offset:0,h=a.width()||c.stripUnit(b.width)||0,i=a.height()||c.stripUnit(b.height)||0,j=c.normalizePadding(b.chartPadding,d);h=Math.max(h,g+j.left+j.right),i=Math.max(i,f+j.top+j.bottom);var k={padding:j,width:function(){return this.x2-this.x1},height:function(){return this.y1-this.y2}};return e?("start"===b.axisX.position?(k.y2=j.top+g,k.y1=Math.max(i-j.bottom,k.y2+1)):(k.y2=j.top,k.y1=Math.max(i-j.bottom-g,k.y2+1)),"start"===b.axisY.position?(k.x1=j.left+f,k.x2=Math.max(h-j.right,k.x1+1)):(k.x1=j.left,k.x2=Math.max(h-j.right-f,k.x1+1))):(k.x1=j.left,k.x2=Math.max(h-j.right,k.x1+1),k.y2=j.top,k.y1=Math.max(i-j.bottom,k.y2+1)),k},c.createGrid=function(a,b,d,e,f,g,h,i){var j={};j[d.units.pos+"1"]=a.pos,j[d.units.pos+"2"]=a.pos,j[d.counterUnits.pos+"1"]=e,j[d.counterUnits.pos+"2"]=e+f;var k=g.elem("line",j,h.join(" "));i.emit("draw",c.extend({type:"grid",axis:d,index:b,group:g,element:k},j))},c.createLabel=function(a,b,d,e,f,g,h,i,j,k){var l,m={};if(m[e.units.pos]=a.pos+g[e.units.pos],m[e.counterUnits.pos]=g[e.counterUnits.pos],m[e.units.len]=a.len,m[e.counterUnits.len]=f-10,j){var n='<span class="'+i.join(" ")+'" style="'+e.units.len+": "+Math.round(m[e.units.len])+"px; "+e.counterUnits.len+": "+Math.round(m[e.counterUnits.len])+'px">'+d[b]+"</span>";l=h.foreignObject(n,c.extend({style:"overflow: visible;"},m))}else l=h.elem("text",m,i.join(" ")).text(d[b]);k.emit("draw",c.extend({type:"label",axis:e,index:b,group:h,element:l,text:d[b]},m))},c.createAxis=function(a,b,d,e,f,g,h,i){var j=h["axis"+a.units.pos.toUpperCase()],k=b.map(a.projectValue.bind(a)),l=b.map(j.labelInterpolationFnc);k.forEach(function(b,k){var m={x:0,y:0};(l[k]||0===l[k])&&("x"===a.units.pos?(b.pos=d.x1+b.pos,m.x=h.axisX.labelOffset.x,"start"===h.axisX.position?m.y=d.padding.top+h.axisX.labelOffset.y+(g?5:20):m.y=d.y1+h.axisX.labelOffset.y+(g?5:20)):(b.pos=d.y1-b.pos,m.y=h.axisY.labelOffset.y-(g?b.len:0),"start"===h.axisY.position?m.x=g?d.padding.left+h.axisY.labelOffset.x:d.x1-10:m.x=d.x2+h.axisY.labelOffset.x+10),j.showGrid&&c.createGrid(b,k,a,a.gridOffset,d[a.counterUnits.len](),e,[h.classNames.grid,h.classNames[a.units.dir]],i),j.showLabel&&c.createLabel(b,k,l,a,j.offset,m,f,[h.classNames.label,h.classNames[a.units.dir],h.classNames[j.position]],g,i))})},c.getSeriesOption=function(a,b,c){if(a.name&&b.series&&b.series[a.name]){var d=b.series[a.name];return d.hasOwnProperty(c)?d[c]:b[c]}return b[c]},c.optionsProvider=function(b,d,e){function f(b){var f=h;if(h=c.extend({},j),d)for(i=0;i<d.length;i++){var g=a.matchMedia(d[i][0]);g.matches&&(h=c.extend(h,d[i][1]))}e&&!b&&e.emit("optionsChanged",{previousOptions:f,currentOptions:h})}function g(){k.forEach(function(a){a.removeListener(f)})}var h,i,j=c.extend({},b),k=[];if(!a.matchMedia)throw"window.matchMedia not found! Make sure you're using a polyfill.";if(d)for(i=0;i<d.length;i++){var l=a.matchMedia(d[i][0]);l.addListener(f),k.push(l)}return f(!0),{removeMediaQueryListeners:g,getCurrentOptions:function(){return c.extend({},h)}}}}(window,document,a),function(a,b,c){"use strict";c.Interpolation={},c.Interpolation.none=function(){return function(a,b){for(var d=new c.Svg.Path,e=!0,f=1;f<a.length;f+=2){var g=b[(f-1)/2];void 0===g.value?e=!0:e?(d.move(a[f-1],a[f],!1,g),e=!1):d.line(a[f-1],a[f],!1,g)}return d}},c.Interpolation.simple=function(a){var b={divisor:2};a=c.extend({},b,a);var d=1/Math.max(1,a.divisor);return function(a,b){for(var e=new c.Svg.Path,f=!0,g=2;g<a.length;g+=2){var h=a[g-2],i=a[g-1],j=a[g],k=a[g+1],l=(j-h)*d,m=b[g/2-1],n=b[g/2];void 0===m.value?f=!0:(f&&e.move(h,i,!1,m),void 0!==n.value&&(e.curve(h+l,i,j-l,k,j,k,!1,n),f=!1))}return e}},c.Interpolation.cardinal=function(a){function b(a,b){for(var c=[],d=!0,e=0;e<a.length;e+=2)void 0===b[e/2].value?d=!0:(d&&(c.push({pathCoordinates:[],valueData:[]}),d=!1),c[c.length-1].pathCoordinates.push(a[e],a[e+1]),c[c.length-1].valueData.push(b[e/2]));return c}var d={tension:1};a=c.extend({},d,a);var e=Math.min(1,Math.max(0,a.tension)),f=1-e;return function g(a,d){var h=b(a,d);if(h.length>1){var i=[];return h.forEach(function(a){i.push(g(a.pathCoordinates,a.valueData))}),c.Svg.Path.join(i)}if(a=h[0].pathCoordinates,d=h[0].valueData,a.length<=4)return c.Interpolation.none()(a,d);for(var j,k=(new c.Svg.Path).move(a[0],a[1],!1,d[0]),l=0,m=a.length;m-2*!j>l;l+=2){var n=[{x:+a[l-2],y:+a[l-1]},{x:+a[l],y:+a[l+1]},{x:+a[l+2],y:+a[l+3]},{x:+a[l+4],y:+a[l+5]}];j?l?m-4===l?n[3]={x:+a[0],y:+a[1]}:m-2===l&&(n[2]={x:+a[0],y:+a[1]},n[3]={x:+a[2],y:+a[3]}):n[0]={x:+a[m-2],y:+a[m-1]}:m-4===l?n[3]=n[2]:l||(n[0]={x:+a[l],y:+a[l+1]}),k.curve(e*(-n[0].x+6*n[1].x+n[2].x)/6+f*n[2].x,e*(-n[0].y+6*n[1].y+n[2].y)/6+f*n[2].y,e*(n[1].x+6*n[2].x-n[3].x)/6+f*n[2].x,e*(n[1].y+6*n[2].y-n[3].y)/6+f*n[2].y,n[2].x,n[2].y,!1,d[(l+2)/2])}return k}},c.Interpolation.step=function(a){var b={postpone:!0};return a=c.extend({},b,a),function(b,d){for(var e=new c.Svg.Path,f=!0,g=2;g<b.length;g+=2){var h=b[g-2],i=b[g-1],j=b[g],k=b[g+1],l=d[g/2-1],m=d[g/2];void 0===l.value?f=!0:(f&&e.move(h,i,!1,l),void 0!==m.value&&(a.postpone?e.line(j,i,!1,l):e.line(h,k,!1,m),e.line(j,k,!1,m),f=!1))}return e}}}(window,document,a),function(a,b,c){"use strict";c.EventEmitter=function(){function a(a,b){d[a]=d[a]||[],d[a].push(b)}function b(a,b){d[a]&&(b?(d[a].splice(d[a].indexOf(b),1),0===d[a].length&&delete d[a]):delete d[a])}function c(a,b){d[a]&&d[a].forEach(function(a){a(b)}),d["*"]&&d["*"].forEach(function(c){c(a,b)})}var d=[];return{addEventHandler:a,removeEventHandler:b,emit:c}}}(window,document,a),function(a,b,c){"use strict";function d(a){var b=[];if(a.length)for(var c=0;c<a.length;c++)b.push(a[c]);return b}function e(a,b){var d=b||this.prototype||c.Class,e=Object.create(d);c.Class.cloneDefinitions(e,a);var f=function(){var a,b=e.constructor||function(){};return a=this===c?Object.create(e):this,b.apply(a,Array.prototype.slice.call(arguments,0)),a};return f.prototype=e,f["super"]=d,f.extend=this.extend,f}function f(){var a=d(arguments),b=a[0];return a.splice(1,a.length-1).forEach(function(a){Object.getOwnPropertyNames(a).forEach(function(c){delete b[c],Object.defineProperty(b,c,Object.getOwnPropertyDescriptor(a,c))})}),b}c.Class={extend:e,cloneDefinitions:f}}(window,document,a),function(a,b,c){"use strict";function d(a,b,d){return a&&(this.data=a,this.eventEmitter.emit("data",{type:"update",data:this.data})),b&&(this.options=c.extend({},d?this.options:this.defaultOptions,b),this.initializeTimeoutId||(this.optionsProvider.removeMediaQueryListeners(),this.optionsProvider=c.optionsProvider(this.options,this.responsiveOptions,this.eventEmitter))),this.initializeTimeoutId||this.createChart(this.optionsProvider.getCurrentOptions()),this}function e(){return this.initializeTimeoutId?a.clearTimeout(this.initializeTimeoutId):(a.removeEventListener("resize",this.resizeListener),this.optionsProvider.removeMediaQueryListeners()),this}function f(a,b){return this.eventEmitter.addEventHandler(a,b),this}function g(a,b){return this.eventEmitter.removeEventHandler(a,b),this}function h(){a.addEventListener("resize",this.resizeListener),this.optionsProvider=c.optionsProvider(this.options,this.responsiveOptions,this.eventEmitter),this.eventEmitter.addEventHandler("optionsChanged",function(){this.update()}.bind(this)),this.options.plugins&&this.options.plugins.forEach(function(a){a instanceof Array?a[0](this,a[1]):a(this)}.bind(this)),this.eventEmitter.emit("data",{type:"initial",data:this.data}),this.createChart(this.optionsProvider.getCurrentOptions()),this.initializeTimeoutId=void 0}function i(a,b,d,e,f){this.container=c.querySelector(a),this.data=b,this.defaultOptions=d,this.options=e,this.responsiveOptions=f,this.eventEmitter=c.EventEmitter(),this.supportsForeignObject=c.Svg.isSupported("Extensibility"),this.supportsAnimations=c.Svg.isSupported("AnimationEventsAttribute"),this.resizeListener=function(){this.update()}.bind(this),this.container&&(this.container.__chartist__&&this.container.__chartist__.detach(),this.container.__chartist__=this),this.initializeTimeoutId=setTimeout(h.bind(this),0)}c.Base=c.Class.extend({constructor:i,optionsProvider:void 0,container:void 0,svg:void 0,eventEmitter:void 0,createChart:function(){throw new Error("Base chart type can't be instantiated!")},update:d,detach:e,on:f,off:g,version:c.version,supportsForeignObject:!1})}(window,document,a),function(a,b,c){"use strict";function d(a,d,e,f,g){a instanceof Element?this._node=a:(this._node=b.createElementNS(z,a),"svg"===a&&this._node.setAttributeNS(A,c.xmlNs.qualifiedName,c.xmlNs.uri),d&&this.attr(d),e&&this.addClass(e),f&&(g&&f._node.firstChild?f._node.insertBefore(this._node,f._node.firstChild):f._node.appendChild(this._node)))}function e(a,b){return"string"==typeof a?b?this._node.getAttributeNS(b,a):this._node.getAttribute(a):(Object.keys(a).forEach(function(d){void 0!==a[d]&&(b?this._node.setAttributeNS(b,[c.xmlNs.prefix,":",d].join(""),a[d]):this._node.setAttribute(d,a[d]))}.bind(this)),this)}function f(a,b,d,e){return new c.Svg(a,b,d,this,e)}function g(){return this._node.parentNode instanceof SVGElement?new c.Svg(this._node.parentNode):null}function h(){for(var a=this._node;"svg"!==a.nodeName;)a=a.parentNode;return new c.Svg(a)}function i(a){var b=this._node.querySelector(a);return b?new c.Svg(b):null}function j(a){var b=this._node.querySelectorAll(a);return b.length?new c.Svg.List(b):null}function k(a,c,d,e){if("string"==typeof a){var f=b.createElement("div");f.innerHTML=a,a=f.firstChild}a.setAttribute("xmlns",B);var g=this.elem("foreignObject",c,d,e);return g._node.appendChild(a),g}function l(a){return this._node.appendChild(b.createTextNode(a)),this}function m(){for(;this._node.firstChild;)this._node.removeChild(this._node.firstChild);return this}function n(){return this._node.parentNode.removeChild(this._node),this.parent()}function o(a){return this._node.parentNode.replaceChild(a._node,this._node),a}function p(a,b){return b&&this._node.firstChild?this._node.insertBefore(a._node,this._node.firstChild):this._node.appendChild(a._node),this}function q(){return this._node.getAttribute("class")?this._node.getAttribute("class").trim().split(/\s+/):[]}function r(a){return this._node.setAttribute("class",this.classes(this._node).concat(a.trim().split(/\s+/)).filter(function(a,b,c){return c.indexOf(a)===b}).join(" ")),this}function s(a){var b=a.trim().split(/\s+/);return this._node.setAttribute("class",this.classes(this._node).filter(function(a){return-1===b.indexOf(a)}).join(" ")),this}function t(){return this._node.setAttribute("class",""),this}function u(a,b){try{return a.getBBox()[b]}catch(c){}return 0}function v(){return this._node.clientHeight||Math.round(u(this._node,"height"))||this._node.parentNode.clientHeight}function w(){return this._node.clientWidth||Math.round(u(this._node,"width"))||this._node.parentNode.clientWidth}function x(a,b,d){return void 0===b&&(b=!0),Object.keys(a).forEach(function(e){function f(a,b){var f,g,h,i={};a.easing&&(h=a.easing instanceof Array?a.easing:c.Svg.Easing[a.easing],delete a.easing),a.begin=c.ensureUnit(a.begin,"ms"),a.dur=c.ensureUnit(a.dur,"ms"),h&&(a.calcMode="spline",a.keySplines=h.join(" "),a.keyTimes="0;1"),b&&(a.fill="freeze",i[e]=a.from,this.attr(i),g=c.stripUnit(a.begin||0),a.begin="indefinite"),f=this.elem("animate",c.extend({attributeName:e},a)),b&&setTimeout(function(){try{f._node.beginElement()}catch(b){i[e]=a.to,this.attr(i),f.remove()}}.bind(this),g),d&&f._node.addEventListener("beginEvent",function(){d.emit("animationBegin",{element:this,animate:f._node,params:a})}.bind(this)),f._node.addEventListener("endEvent",function(){d&&d.emit("animationEnd",{element:this,animate:f._node,params:a}),b&&(i[e]=a.to,this.attr(i),f.remove())}.bind(this))}a[e]instanceof Array?a[e].forEach(function(a){f.bind(this)(a,!1)}.bind(this)):f.bind(this)(a[e],b)}.bind(this)),this}function y(a){var b=this;this.svgElements=[];for(var d=0;d<a.length;d++)this.svgElements.push(new c.Svg(a[d]));Object.keys(c.Svg.prototype).filter(function(a){return-1===["constructor","parent","querySelector","querySelectorAll","replace","append","classes","height","width"].indexOf(a)}).forEach(function(a){b[a]=function(){var d=Array.prototype.slice.call(arguments,0);return b.svgElements.forEach(function(b){c.Svg.prototype[a].apply(b,d)}),b}})}var z="http://www.w3.org/2000/svg",A="http://www.w3.org/2000/xmlns/",B="http://www.w3.org/1999/xhtml";c.xmlNs={qualifiedName:"xmlns:ct",prefix:"ct",uri:"http://gionkunz.github.com/chartist-js/ct"},c.Svg=c.Class.extend({constructor:d,attr:e,elem:f,parent:g,root:h,querySelector:i,querySelectorAll:j,foreignObject:k,text:l,empty:m,remove:n,replace:o,append:p,classes:q,addClass:r,removeClass:s,removeAllClasses:t,height:v,width:w,animate:x}),c.Svg.isSupported=function(a){return b.implementation.hasFeature("www.http://w3.org/TR/SVG11/feature#"+a,"1.1")};var C={easeInSine:[.47,0,.745,.715],easeOutSine:[.39,.575,.565,1],easeInOutSine:[.445,.05,.55,.95],easeInQuad:[.55,.085,.68,.53],easeOutQuad:[.25,.46,.45,.94],easeInOutQuad:[.455,.03,.515,.955],easeInCubic:[.55,.055,.675,.19],easeOutCubic:[.215,.61,.355,1],easeInOutCubic:[.645,.045,.355,1],easeInQuart:[.895,.03,.685,.22],easeOutQuart:[.165,.84,.44,1],easeInOutQuart:[.77,0,.175,1],easeInQuint:[.755,.05,.855,.06],easeOutQuint:[.23,1,.32,1],easeInOutQuint:[.86,0,.07,1],easeInExpo:[.95,.05,.795,.035],easeOutExpo:[.19,1,.22,1],easeInOutExpo:[1,0,0,1],easeInCirc:[.6,.04,.98,.335],easeOutCirc:[.075,.82,.165,1],easeInOutCirc:[.785,.135,.15,.86],easeInBack:[.6,-.28,.735,.045],easeOutBack:[.175,.885,.32,1.275],easeInOutBack:[.68,-.55,.265,1.55]};c.Svg.Easing=C,c.Svg.List=c.Class.extend({constructor:y})}(window,document,a),function(a,b,c){"use strict";function d(a,b,d,e,f,g){var h=c.extend({command:f?a.toLowerCase():a.toUpperCase()},b,g?{data:g}:{});d.splice(e,0,h)}function e(a,b){a.forEach(function(c,d){u[c.command.toLowerCase()].forEach(function(e,f){b(c,e,d,f,a)})})}function f(a,b){this.pathElements=[],this.pos=0,this.close=a,this.options=c.extend({},v,b)}function g(a){return void 0!==a?(this.pos=Math.max(0,Math.min(this.pathElements.length,a)),this):this.pos}function h(a){return this.pathElements.splice(this.pos,a),this}function i(a,b,c,e){return d("M",{x:+a,y:+b},this.pathElements,this.pos++,c,e),this}function j(a,b,c,e){return d("L",{x:+a,y:+b},this.pathElements,this.pos++,c,e),this}function k(a,b,c,e,f,g,h,i){return d("C",{x1:+a,y1:+b,x2:+c,y2:+e,x:+f,y:+g},this.pathElements,this.pos++,h,i),this}function l(a,b,c,e,f,g,h,i,j){return d("A",{rx:+a,ry:+b,xAr:+c,lAf:+e,sf:+f,x:+g,y:+h},this.pathElements,this.pos++,i,j),this}function m(a){var b=a.replace(/([A-Za-z])([0-9])/g,"$1 $2").replace(/([0-9])([A-Za-z])/g,"$1 $2").split(/[\s,]+/).reduce(function(a,b){return b.match(/[A-Za-z]/)&&a.push([]),a[a.length-1].push(b),a},[]);"Z"===b[b.length-1][0].toUpperCase()&&b.pop();var d=b.map(function(a){var b=a.shift(),d=u[b.toLowerCase()];return c.extend({command:b},d.reduce(function(b,c,d){return b[c]=+a[d],b},{}))}),e=[this.pos,0];return Array.prototype.push.apply(e,d),Array.prototype.splice.apply(this.pathElements,e),this.pos+=d.length,this}function n(){var a=Math.pow(10,this.options.accuracy);return this.pathElements.reduce(function(b,c){var d=u[c.command.toLowerCase()].map(function(b){return this.options.accuracy?Math.round(c[b]*a)/a:c[b]}.bind(this));return b+c.command+d.join(",")}.bind(this),"")+(this.close?"Z":"")}function o(a,b){return e(this.pathElements,function(c,d){c[d]*="x"===d[0]?a:b}),this}function p(a,b){return e(this.pathElements,function(c,d){c[d]+="x"===d[0]?a:b}),this}function q(a){return e(this.pathElements,function(b,c,d,e,f){var g=a(b,c,d,e,f);(g||0===g)&&(b[c]=g)}),this}function r(a){var b=new c.Svg.Path(a||this.close);return b.pos=this.pos,b.pathElements=this.pathElements.slice().map(function(a){return c.extend({},a)}),b.options=c.extend({},this.options),b}function s(a){var b=[new c.Svg.Path];return this.pathElements.forEach(function(d){d.command===a.toUpperCase()&&0!==b[b.length-1].pathElements.length&&b.push(new c.Svg.Path),b[b.length-1].pathElements.push(d)}),b}function t(a,b,d){for(var e=new c.Svg.Path(b,d),f=0;f<a.length;f++)for(var g=a[f],h=0;h<g.pathElements.length;h++)e.pathElements.push(g.pathElements[h]);return e}var u={m:["x","y"],l:["x","y"],c:["x1","y1","x2","y2","x","y"],a:["rx","ry","xAr","lAf","sf","x","y"]},v={accuracy:3};c.Svg.Path=c.Class.extend({constructor:f,position:g,remove:h,move:i,line:j,curve:k,arc:l,scale:o,translate:p,transform:q,parse:m,stringify:n,clone:r,splitByCommand:s}),c.Svg.Path.elementDescriptions=u,c.Svg.Path.join=t}(window,document,a),function(a,b,c){"use strict";function d(a,b,c){this.units=a,this.counterUnits=a===e.x?e.y:e.x,this.chartRect=b,this.axisLength=b[a.rectEnd]-b[a.rectStart],this.gridOffset=b[a.rectOffset],this.options=c}var e={x:{pos:"x",len:"width",dir:"horizontal",rectStart:"x1",rectEnd:"x2",rectOffset:"y2"},y:{pos:"y",len:"height",dir:"vertical",rectStart:"y2",rectEnd:"y1",rectOffset:"x1"}};c.Axis=c.Class.extend({constructor:d,projectValue:function(a,b,c){throw new Error("Base axis can't be instantiated!")}}),c.Axis.units=e}(window,document,a),function(a,b,c){"use strict";function d(a,b,d){c.LinearScaleAxis["super"].constructor.call(this,a,b,d),this.bounds=c.getBounds(this.axisLength,d.highLow,d.scaleMinSpace,d.referenceValue,d.onlyInteger)}function e(a){return{pos:this.axisLength*(a-this.bounds.min)/this.bounds.range,len:c.projectLength(this.axisLength,this.bounds.step,this.bounds)}}c.LinearScaleAxis=c.Axis.extend({constructor:d,projectValue:e})}(window,document,a),function(a,b,c){"use strict";function d(a,b,d){c.StepAxis["super"].constructor.call(this,a,b,d),this.stepLength=this.axisLength/(d.stepCount-(d.stretch?1:0))}function e(a,b){return{pos:this.stepLength*b,len:this.stepLength}}c.StepAxis=c.Axis.extend({constructor:d,projectValue:e})}(window,document,a),function(a,b,c){"use strict";function d(a){var b=[],d=c.normalizeDataArray(c.getDataArray(this.data,a.reverseData),this.data.labels.length);this.svg=c.createSvg(this.container,a.width,a.height,a.classNames.chart);var e=c.createChartRect(this.svg,a,f.padding),g=c.getHighLow(d,a),h=new c.StepAxis(c.Axis.units.x,e,{stepCount:this.data.labels.length,stretch:a.fullWidth}),i=new c.LinearScaleAxis(c.Axis.units.y,e,{highLow:g,scaleMinSpace:a.axisY.scaleMinSpace,onlyInteger:a.axisY.onlyInteger}),j=this.svg.elem("g").addClass(a.classNames.labelGroup),k=this.svg.elem("g").addClass(a.classNames.gridGroup);c.createAxis(h,this.data.labels,e,k,j,this.supportsForeignObject,a,this.eventEmitter),c.createAxis(i,i.bounds.values,e,k,j,this.supportsForeignObject,a,this.eventEmitter),this.data.series.forEach(function(f,g){b[g]=this.svg.elem("g"),b[g].attr({"series-name":f.name,meta:c.serialize(f.meta)},c.xmlNs.uri),b[g].addClass([a.classNames.series,f.className||a.classNames.series+"-"+c.alphaNumerate(g)].join(" "));var j=[],k=[];d[g].forEach(function(a,b){var l={x:e.x1+h.projectValue(a,b,d[g]).pos,y:e.y1-i.projectValue(a,b,d[g]).pos};j.push(l.x,l.y),k.push({value:a,valueIndex:b,meta:c.getMetaData(f,b)})}.bind(this));var l={lineSmooth:c.getSeriesOption(f,a,"lineSmooth"),showPoint:c.getSeriesOption(f,a,"showPoint"),showLine:c.getSeriesOption(f,a,"showLine"),showArea:c.getSeriesOption(f,a,"showArea")},m="function"==typeof l.lineSmooth?l.lineSmooth:l.lineSmooth?c.Interpolation.cardinal():c.Interpolation.none(),n=m(j,k);if(l.showPoint&&n.pathElements.forEach(function(d){var e=b[g].elem("line",{x1:d.x,y1:d.y,x2:d.x+.01,y2:d.y},a.classNames.point).attr({value:d.data.value,meta:d.data.meta},c.xmlNs.uri);this.eventEmitter.emit("draw",{type:"point",value:d.data.value,index:d.data.valueIndex,meta:d.data.meta,series:f,seriesIndex:g,group:b[g],element:e,x:d.x,y:d.y})}.bind(this)),l.showLine){var o=b[g].elem("path",{d:n.stringify()},a.classNames.line,!0).attr({values:d[g]},c.xmlNs.uri);this.eventEmitter.emit("draw",{type:"line",values:d[g],path:n.clone(),chartRect:e,index:g,series:f,seriesIndex:g,group:b[g],element:o})}if(l.showArea){var p=Math.max(Math.min(a.areaBase,i.bounds.max),i.bounds.min),q=e.y1-i.projectValue(p).pos;n.splitByCommand("M").filter(function(a){return a.pathElements.length>1}).map(function(a){var b=a.pathElements[0],c=a.pathElements[a.pathElements.length-1];return a.clone(!0).position(0).remove(1).move(b.x,q).line(b.x,b.y).position(a.pathElements.length+1).line(c.x,q)}).forEach(function(h){var i=b[g].elem("path",{d:h.stringify()},a.classNames.area,!0).attr({values:d[g]},c.xmlNs.uri);this.eventEmitter.emit("draw",{type:"area",values:d[g],path:h.clone(),series:f,seriesIndex:g,chartRect:e,index:g,group:b[g],element:i})}.bind(this))}}.bind(this)),this.eventEmitter.emit("created",{bounds:i.bounds,chartRect:e,axisX:h,axisY:i,svg:this.svg,options:a})}function e(a,b,d,e){c.Line["super"].constructor.call(this,a,b,f,c.extend({},f,d),e)}var f={axisX:{offset:30,position:"end",labelOffset:{x:0,y:0},showLabel:!0,showGrid:!0,labelInterpolationFnc:c.noop,onlyInteger:!1},axisY:{offset:40,position:"start",labelOffset:{x:0,y:0},showLabel:!0,showGrid:!0,labelInterpolationFnc:c.noop,scaleMinSpace:20,onlyInteger:!1},width:void 0,height:void 0,showLine:!0,showPoint:!0,showArea:!1,areaBase:0,lineSmooth:!0,low:void 0,high:void 0,chartPadding:{top:15,right:15,bottom:5,left:10},fullWidth:!1,reverseData:!1,classNames:{chart:"ct-chart-line",label:"ct-label",labelGroup:"ct-labels",series:"ct-series",line:"ct-line",point:"ct-point",area:"ct-area",grid:"ct-grid",gridGroup:"ct-grids",vertical:"ct-vertical",horizontal:"ct-horizontal",start:"ct-start",end:"ct-end"}};c.Line=c.Base.extend({constructor:e,createChart:d})}(window,document,a),function(a,b,c){"use strict";function d(a){var b,d=[],e=c.getDataArray(this.data,a.reverseData),g=a.distributeSeries?e.map(function(a){return[a]}):c.normalizeDataArray(e,this.data.labels.length);if(this.svg=c.createSvg(this.container,a.width,a.height,a.classNames.chart+(a.horizontalBars?" "+a.classNames.horizontalBars:"")),a.stackBars){var h=c.serialMap(g,function(){return Array.prototype.slice.call(arguments).reduce(c.sum,0)});b=c.getHighLow([h],a)}else b=c.getHighLow(g,a);b.high=+a.high||(0===a.high?0:b.high),b.low=+a.low||(0===a.low?0:b.low);var i,j,k,l,m,n=c.createChartRect(this.svg,a,f.padding);j=a.distributeSeries&&!a.stackBars?g.length:a.distributeSeries&&a.stackBars?1:this.data.labels.length,a.horizontalBars?(k=m=new c.StepAxis(c.Axis.units.y,n,{stepCount:j}),i=l=new c.LinearScaleAxis(c.Axis.units.x,n,{highLow:b,scaleMinSpace:a.axisX.scaleMinSpace,onlyInteger:a.axisX.onlyInteger,referenceValue:0})):(k=l=new c.StepAxis(c.Axis.units.x,n,{stepCount:j}),i=m=new c.LinearScaleAxis(c.Axis.units.y,n,{highLow:b,scaleMinSpace:a.axisY.scaleMinSpace,onlyInteger:a.axisY.onlyInteger,referenceValue:0}));var o=this.svg.elem("g").addClass(a.classNames.labelGroup),p=this.svg.elem("g").addClass(a.classNames.gridGroup),q=a.horizontalBars?n.x1+i.projectValue(0).pos:n.y1-i.projectValue(0).pos,r=[];c.createAxis(k,this.data.labels,n,p,o,this.supportsForeignObject,a,this.eventEmitter),c.createAxis(i,i.bounds.values,n,p,o,this.supportsForeignObject,a,this.eventEmitter),this.data.series.forEach(function(b,e){var f,h=e-(this.data.series.length-1)/2;f=a.distributeSeries&&!a.stackBars?k.axisLength/g.length/2:a.distributeSeries&&a.stackBars?k.axisLength/2:k.axisLength/g[e].length/2,d[e]=this.svg.elem("g"),d[e].attr({"series-name":b.name,meta:c.serialize(b.meta)},c.xmlNs.uri),d[e].addClass([a.classNames.series,b.className||a.classNames.series+"-"+c.alphaNumerate(e)].join(" ")),g[e].forEach(function(j,l){var m,o,p,s;if(s=a.distributeSeries&&!a.stackBars?e:a.distributeSeries&&a.stackBars?0:l,m=a.horizontalBars?{x:n.x1+i.projectValue(j||0,l,g[e]).pos,y:n.y1-k.projectValue(j||0,s,g[e]).pos}:{x:n.x1+k.projectValue(j||0,s,g[e]).pos,y:n.y1-i.projectValue(j||0,l,g[e]).pos},m[k.units.pos]+=f*(a.horizontalBars?-1:1),m[k.units.pos]+=a.stackBars||a.distributeSeries?0:h*a.seriesBarDistance*(a.horizontalBars?-1:1),p=r[l]||q,r[l]=p-(q-m[k.counterUnits.pos]),void 0!==j){var t={};t[k.units.pos+"1"]=m[k.units.pos],t[k.units.pos+"2"]=m[k.units.pos],t[k.counterUnits.pos+"1"]=a.stackBars?p:q,t[k.counterUnits.pos+"2"]=a.stackBars?r[l]:m[k.counterUnits.pos],o=d[e].elem("line",t,a.classNames.bar).attr({value:j,meta:c.getMetaData(b,l)},c.xmlNs.uri),this.eventEmitter.emit("draw",c.extend({type:"bar",value:j,index:l,meta:c.getMetaData(b,l),series:b,seriesIndex:e,chartRect:n,group:d[e],element:o},t))}}.bind(this))}.bind(this)),this.eventEmitter.emit("created",{bounds:i.bounds,chartRect:n,axisX:l,axisY:m,svg:this.svg,options:a})}function e(a,b,d,e){c.Bar["super"].constructor.call(this,a,b,f,c.extend({},f,d),e)}var f={axisX:{offset:30,position:"end",labelOffset:{x:0,y:0},showLabel:!0,showGrid:!0,labelInterpolationFnc:c.noop,scaleMinSpace:30,onlyInteger:!1},axisY:{offset:40,position:"start",labelOffset:{x:0,y:0},showLabel:!0,showGrid:!0,labelInterpolationFnc:c.noop,scaleMinSpace:20,onlyInteger:!1},width:void 0,height:void 0,high:void 0,low:void 0,onlyInteger:!1,chartPadding:{top:15,right:15,bottom:5,left:10},seriesBarDistance:15,stackBars:!1,horizontalBars:!1,distributeSeries:!1,reverseData:!1,classNames:{chart:"ct-chart-bar",horizontalBars:"ct-horizontal-bars",label:"ct-label",labelGroup:"ct-labels",series:"ct-series",bar:"ct-bar",grid:"ct-grid",gridGroup:"ct-grids",vertical:"ct-vertical",horizontal:"ct-horizontal",start:"ct-start",end:"ct-end"}};c.Bar=c.Base.extend({constructor:e,createChart:d})}(window,document,a),function(a,b,c){"use strict";function d(a,b,c){var d=b.x>a.x;return d&&"explode"===c||!d&&"implode"===c?"start":d&&"implode"===c||!d&&"explode"===c?"end":"middle"}function e(a){var b,e,f,h,i=[],j=a.startAngle,k=c.getDataArray(this.data,a.reverseData);this.svg=c.createSvg(this.container,a.width,a.height,a.donut?a.classNames.chartDonut:a.classNames.chartPie),b=c.createChartRect(this.svg,a,g.padding),e=Math.min(b.width()/2,b.height()/2),h=a.total||k.reduce(function(a,b){return a+b},0),e-=a.donut?a.donutWidth/2:0,f="outside"===a.labelPosition||a.donut?e:"center"===a.labelPosition?0:e/2,f+=a.labelOffset;for(var l={x:b.x1+b.width()/2,y:b.y2+b.height()/2},m=1===this.data.series.filter(function(a){return a.hasOwnProperty("value")?0!==a.value:0!==a}).length,n=0;n<this.data.series.length;n++){var o=this.data.series[n];i[n]=this.svg.elem("g",null,null,!0),i[n].attr({"series-name":o.name},c.xmlNs.uri),i[n].addClass([a.classNames.series,o.className||a.classNames.series+"-"+c.alphaNumerate(n)].join(" "));var p=j+k[n]/h*360;p-j===360&&(p-=.01);var q=c.polarToCartesian(l.x,l.y,e,j-(0===n||m?0:.2)),r=c.polarToCartesian(l.x,l.y,e,p),s=new c.Svg.Path(!a.donut).move(r.x,r.y).arc(e,e,0,p-j>180,0,q.x,q.y);a.donut||s.line(l.x,l.y);var t=i[n].elem("path",{d:s.stringify()},a.donut?a.classNames.sliceDonut:a.classNames.slicePie);if(t.attr({value:k[n],meta:c.serialize(o.meta)},c.xmlNs.uri),a.donut&&t.attr({
style:"stroke-width: "+ +a.donutWidth+"px"}),this.eventEmitter.emit("draw",{type:"slice",value:k[n],totalDataSum:h,index:n,meta:o.meta,series:o,group:i[n],element:t,path:s.clone(),center:l,radius:e,startAngle:j,endAngle:p}),a.showLabel){var u=c.polarToCartesian(l.x,l.y,f,j+(p-j)/2),v=a.labelInterpolationFnc(this.data.labels?this.data.labels[n]:k[n],n);if(v||0===v){var w=i[n].elem("text",{dx:u.x,dy:u.y,"text-anchor":d(l,u,a.labelDirection)},a.classNames.label).text(""+v);this.eventEmitter.emit("draw",{type:"label",index:n,group:i[n],element:w,text:""+v,x:u.x,y:u.y})}}j=p}this.eventEmitter.emit("created",{chartRect:b,svg:this.svg,options:a})}function f(a,b,d,e){c.Pie["super"].constructor.call(this,a,b,g,c.extend({},g,d),e)}var g={width:void 0,height:void 0,chartPadding:5,classNames:{chartPie:"ct-chart-pie",chartDonut:"ct-chart-donut",series:"ct-series",slicePie:"ct-slice-pie",sliceDonut:"ct-slice-donut",label:"ct-label"},startAngle:0,total:void 0,donut:!1,donutWidth:60,showLabel:!0,labelOffset:0,labelPosition:"inside",labelInterpolationFnc:c.noop,labelDirection:"neutral",reverseData:!1};c.Pie=c.Base.extend({constructor:f,createChart:e,determineAnchorPosition:d})}(window,document,a),a});
//# sourceMappingURL=chartist.min.js.map
