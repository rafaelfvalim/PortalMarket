!function(t,o,e){function i(o,e){this.bodyOverflowX,this.callbacks={hide:[],show:[]},this.checkInterval=null,this.Content,this.$el=t(o),this.$elProxy,this.elProxyPosition,this.enabled=!0,this.options=t.extend({},l,e),this.mouseIsOverProxy=!1,this.namespace="tooltipster-"+Math.round(1e5*Math.random()),this.Status="hidden",this.timerHide=null,this.timerShow=null,this.$tooltip,this.options.iconTheme=this.options.iconTheme.replace(".",""),this.options.theme=this.options.theme.replace(".",""),this._init()}function n(o,e){var i=!0;return t.each(o,function(t,n){return"undefined"==typeof e[t]||o[t]!==e[t]?(i=!1,!1):void 0}),i}function s(){return!f&&p}function r(){var t=e.body||e.documentElement,o=t.style,i="transition";if("string"==typeof o[i])return!0;v=["Moz","Webkit","Khtml","O","ms"],i=i.charAt(0).toUpperCase()+i.substr(1);for(var n=0;n<v.length;n++)if("string"==typeof o[v[n]+i])return!0;return!1}var a="tooltipster",l={animation:"fade",arrow:!0,arrowColor:"",autoClose:!0,content:null,contentAsHTML:!1,contentCloning:!0,debug:!0,delay:200,minWidth:0,maxWidth:null,functionInit:function(t,o){},functionBefore:function(t,o){o()},functionReady:function(t,o){},functionAfter:function(t){},icon:"(?)",iconCloning:!0,iconDesktop:!1,iconTouch:!1,iconTheme:"tooltipster-icon",interactive:!1,interactiveTolerance:350,multiple:!1,offsetX:0,offsetY:0,onlyOne:!1,position:"top",positionTracker:!1,speed:350,timer:0,theme:"tooltipster-default",touchDevices:!0,trigger:"hover",updateAnimation:!0};i.prototype={_init:function(){var o=this;if(e.querySelector){if(null!==o.options.content)o._content_set(o.options.content);else{var i=o.$el.attr("title");"undefined"==typeof i&&(i=null),o._content_set(i)}var n=o.options.functionInit.call(o.$el,o.$el,o.Content);"undefined"!=typeof n&&o._content_set(n),o.$el.removeAttr("title").addClass("tooltipstered"),!p&&o.options.iconDesktop||p&&o.options.iconTouch?("string"==typeof o.options.icon?(o.$elProxy=t('<span class="'+o.options.iconTheme+'"></span>'),o.$elProxy.text(o.options.icon)):o.options.iconCloning?o.$elProxy=o.options.icon.clone(!0):o.$elProxy=o.options.icon,o.$elProxy.insertAfter(o.$el)):o.$elProxy=o.$el,"hover"==o.options.trigger?(o.$elProxy.on("mouseenter."+o.namespace,function(){(!s()||o.options.touchDevices)&&(o.mouseIsOverProxy=!0,o._show())}).on("mouseleave."+o.namespace,function(){(!s()||o.options.touchDevices)&&(o.mouseIsOverProxy=!1)}),p&&o.options.touchDevices&&o.$elProxy.on("touchstart."+o.namespace,function(){o._showNow()})):"click"==o.options.trigger&&o.$elProxy.on("click."+o.namespace,function(){(!s()||o.options.touchDevices)&&o._show()})}},_show:function(){var t=this;"shown"!=t.Status&&"appearing"!=t.Status&&(t.options.delay?t.timerShow=setTimeout(function(){("click"==t.options.trigger||"hover"==t.options.trigger&&t.mouseIsOverProxy)&&t._showNow()},t.options.delay):t._showNow())},_showNow:function(e){var i=this;i.options.functionBefore.call(i.$el,i.$el,function(){if(i.enabled&&null!==i.Content){e&&i.callbacks.show.push(e),i.callbacks.hide=[],clearTimeout(i.timerShow),i.timerShow=null,clearTimeout(i.timerHide),i.timerHide=null,i.options.onlyOne&&t(".tooltipstered").not(i.$el).each(function(o,e){var i=t(e),n=i.data("tooltipster-ns");t.each(n,function(t,o){var e=i.data(o),n=e.status(),s=e.option("autoClose");"hidden"!==n&&"disappearing"!==n&&s&&e.hide()})});var n=function(){i.Status="shown",t.each(i.callbacks.show,function(t,o){o.call(i.$el)}),i.callbacks.show=[]};if("hidden"!==i.Status){var s=0;"disappearing"===i.Status?(i.Status="appearing",r()?(i.$tooltip.clearQueue().removeClass("tooltipster-dying").addClass("tooltipster-"+i.options.animation+"-show"),i.options.speed>0&&i.$tooltip.delay(i.options.speed),i.$tooltip.queue(n)):i.$tooltip.stop().fadeIn(n)):"shown"===i.Status&&n()}else{i.Status="appearing";var s=i.options.speed;i.bodyOverflowX=t("body").css("overflow-x"),t("body").css("overflow-x","hidden");var a="tooltipster-"+i.options.animation,l="-webkit-transition-duration: "+i.options.speed+"ms; -webkit-animation-duration: "+i.options.speed+"ms; -moz-transition-duration: "+i.options.speed+"ms; -moz-animation-duration: "+i.options.speed+"ms; -o-transition-duration: "+i.options.speed+"ms; -o-animation-duration: "+i.options.speed+"ms; -ms-transition-duration: "+i.options.speed+"ms; -ms-animation-duration: "+i.options.speed+"ms; transition-duration: "+i.options.speed+"ms; animation-duration: "+i.options.speed+"ms;",f=i.options.minWidth?"min-width:"+Math.round(i.options.minWidth)+"px;":"",d=i.options.maxWidth?"max-width:"+Math.round(i.options.maxWidth)+"px;":"",c=i.options.interactive?"pointer-events: auto;":"";if(i.$tooltip=t('<div class="tooltipster-base '+i.options.theme+'" style="'+f+" "+d+" "+c+" "+l+'"><div class="tooltipster-content"></div></div>'),r()&&i.$tooltip.addClass(a),i._content_insert(),i.$tooltip.appendTo("body"),i.reposition(),i.options.functionReady.call(i.$el,i.$el,i.$tooltip),r()?(i.$tooltip.addClass(a+"-show"),i.options.speed>0&&i.$tooltip.delay(i.options.speed),i.$tooltip.queue(n)):i.$tooltip.css("display","none").fadeIn(i.options.speed,n),i._interval_set(),t(o).on("scroll."+i.namespace+" resize."+i.namespace,function(){i.reposition()}),i.options.autoClose)if(t("body").off("."+i.namespace),"hover"==i.options.trigger)if(p&&setTimeout(function(){t("body").on("touchstart."+i.namespace,function(){i.hide()})},0),i.options.interactive){p&&i.$tooltip.on("touchstart."+i.namespace,function(t){t.stopPropagation()});var h=null;i.$elProxy.add(i.$tooltip).on("mouseleave."+i.namespace+"-autoClose",function(){clearTimeout(h),h=setTimeout(function(){i.hide()},i.options.interactiveTolerance)}).on("mouseenter."+i.namespace+"-autoClose",function(){clearTimeout(h)})}else i.$elProxy.on("mouseleave."+i.namespace+"-autoClose",function(){i.hide()});else"click"==i.options.trigger&&(setTimeout(function(){t("body").on("click."+i.namespace+" touchstart."+i.namespace,function(){i.hide()})},0),i.options.interactive&&i.$tooltip.on("click."+i.namespace+" touchstart."+i.namespace,function(t){t.stopPropagation()}))}i.options.timer>0&&(i.timerHide=setTimeout(function(){i.timerHide=null,i.hide()},i.options.timer+s))}})},_interval_set:function(){var o=this;o.checkInterval=setInterval(function(){if(0===t("body").find(o.$el).length||0===t("body").find(o.$elProxy).length||"hidden"==o.Status||0===t("body").find(o.$tooltip).length)("shown"==o.Status||"appearing"==o.Status)&&o.hide(),o._interval_cancel();else if(o.options.positionTracker){var e=o._repositionInfo(o.$elProxy),i=!1;n(e.dimension,o.elProxyPosition.dimension)&&("fixed"===o.$elProxy.css("position")?n(e.position,o.elProxyPosition.position)&&(i=!0):n(e.offset,o.elProxyPosition.offset)&&(i=!0)),i||o.reposition()}},200)},_interval_cancel:function(){clearInterval(this.checkInterval),this.checkInterval=null},_content_set:function(t){"object"==typeof t&&null!==t&&this.options.contentCloning&&(t=t.clone(!0)),this.Content=t},_content_insert:function(){var t=this,o=this.$tooltip.find(".tooltipster-content");"string"!=typeof t.Content||t.options.contentAsHTML?o.empty().append(t.Content):o.text(t.Content)},_update:function(t){var o=this;o._content_set(t),null!==o.Content?"hidden"!==o.Status&&(o._content_insert(),o.reposition(),o.options.updateAnimation&&(r()?(o.$tooltip.css({width:"","-webkit-transition":"all "+o.options.speed+"ms, width 0ms, height 0ms, left 0ms, top 0ms","-moz-transition":"all "+o.options.speed+"ms, width 0ms, height 0ms, left 0ms, top 0ms","-o-transition":"all "+o.options.speed+"ms, width 0ms, height 0ms, left 0ms, top 0ms","-ms-transition":"all "+o.options.speed+"ms, width 0ms, height 0ms, left 0ms, top 0ms",transition:"all "+o.options.speed+"ms, width 0ms, height 0ms, left 0ms, top 0ms"}).addClass("tooltipster-content-changing"),setTimeout(function(){"hidden"!=o.Status&&(o.$tooltip.removeClass("tooltipster-content-changing"),setTimeout(function(){"hidden"!==o.Status&&o.$tooltip.css({"-webkit-transition":o.options.speed+"ms","-moz-transition":o.options.speed+"ms","-o-transition":o.options.speed+"ms","-ms-transition":o.options.speed+"ms",transition:o.options.speed+"ms"})},o.options.speed))},o.options.speed)):o.$tooltip.fadeTo(o.options.speed,.5,function(){"hidden"!=o.Status&&o.$tooltip.fadeTo(o.options.speed,1)}))):o.hide()},_repositionInfo:function(t){return{dimension:{height:t.outerHeight(!1),width:t.outerWidth(!1)},offset:t.offset(),position:{left:parseInt(t.css("left")),top:parseInt(t.css("top"))}}},hide:function(e){var i=this;e&&i.callbacks.hide.push(e),i.callbacks.show=[],clearTimeout(i.timerShow),i.timerShow=null,clearTimeout(i.timerHide),i.timerHide=null;var n=function(){t.each(i.callbacks.hide,function(t,o){o.call(i.$el)}),i.callbacks.hide=[]};if("shown"==i.Status||"appearing"==i.Status){i.Status="disappearing";var s=function(){i.Status="hidden","object"==typeof i.Content&&null!==i.Content&&i.Content.detach(),i.$tooltip.remove(),i.$tooltip=null,t(o).off("."+i.namespace),t("body").off("."+i.namespace).css("overflow-x",i.bodyOverflowX),t("body").off("."+i.namespace),i.$elProxy.off("."+i.namespace+"-autoClose"),i.options.functionAfter.call(i.$el,i.$el),n()};r()?(i.$tooltip.clearQueue().removeClass("tooltipster-"+i.options.animation+"-show").addClass("tooltipster-dying"),i.options.speed>0&&i.$tooltip.delay(i.options.speed),i.$tooltip.queue(s)):i.$tooltip.stop().fadeOut(i.options.speed,s)}else"hidden"==i.Status&&n();return i},show:function(t){return this._showNow(t),this},update:function(t){return this.content(t)},content:function(t){return"undefined"==typeof t?this.Content:(this._update(t),this)},reposition:function(){function e(){var e=t(o).scrollLeft();0>I-e&&(s=I-e,I=e),I+l-e>r&&(s=I-(r+e-l),I=r+e-l)}function i(e,i){a.offset.top-t(o).scrollTop()-p-H-12<0&&i.indexOf("top")>-1&&(D=e),a.offset.top+a.dimension.height+p+12+H>t(o).scrollTop()+t(o).height()&&i.indexOf("bottom")>-1&&(D=e,O=a.offset.top-p-H-12)}var n=this;if(0!==t("body").find(n.$tooltip).length){n.$tooltip.css("width",""),n.elProxyPosition=n._repositionInfo(n.$elProxy);var s=null,r=t(o).width(),a=n.elProxyPosition,l=n.$tooltip.outerWidth(!1),p=(n.$tooltip.innerWidth()+1,n.$tooltip.outerHeight(!1));if(n.$elProxy.is("area")){var f=n.$elProxy.attr("shape"),d=n.$elProxy.parent().attr("name"),c=t('img[usemap="#'+d+'"]'),h=c.offset().left,u=c.offset().top,m=void 0!==n.$elProxy.attr("coords")?n.$elProxy.attr("coords").split(","):void 0;if("circle"==f){var v=parseInt(m[0]),$=parseInt(m[1]),g=parseInt(m[2]);a.dimension.height=2*g,a.dimension.width=2*g,a.offset.top=u+$-g,a.offset.left=h+v-g}else if("rect"==f){var v=parseInt(m[0]),$=parseInt(m[1]),y=parseInt(m[2]),w=parseInt(m[3]);a.dimension.height=w-$,a.dimension.width=y-v,a.offset.top=u+$,a.offset.left=h+v}else if("poly"==f){for(var b=0,x=0,P=0,C=0,_="even",T=0;T<m.length;T++){var k=parseInt(m[T]);"even"==_?(k>P&&(P=k,0===T&&(b=P)),b>k&&(b=k),_="odd"):(k>C&&(C=k,1==T&&(x=C)),x>k&&(x=k),_="even")}a.dimension.height=C-x,a.dimension.width=P-b,a.offset.top=u+x,a.offset.left=h+b}else a.dimension.height=c.outerHeight(!1),a.dimension.width=c.outerWidth(!1),a.offset.top=u,a.offset.left=h}var I=0,S=0,O=0,H=parseInt(n.options.offsetY),M=parseInt(n.options.offsetX),D=n.options.position;if("top"==D){var W=a.offset.left+l-(a.offset.left+a.dimension.width);I=a.offset.left+M-W/2,O=a.offset.top-p-H-12,e(),i("bottom","top")}if("top-left"==D&&(I=a.offset.left+M,O=a.offset.top-p-H-12,e(),i("bottom-left","top-left")),"top-right"==D&&(I=a.offset.left+a.dimension.width+M-l,O=a.offset.top-p-H-12,e(),i("bottom-right","top-right")),"bottom"==D){var W=a.offset.left+l-(a.offset.left+a.dimension.width);I=a.offset.left-W/2+M,O=a.offset.top+a.dimension.height+H+12,e(),i("top","bottom")}if("bottom-left"==D&&(I=a.offset.left+M,O=a.offset.top+a.dimension.height+H+12,e(),i("top-left","bottom-left")),"bottom-right"==D&&(I=a.offset.left+a.dimension.width+M-l,O=a.offset.top+a.dimension.height+H+12,e(),i("top-right","bottom-right")),"left"==D){I=a.offset.left-M-l-12,S=a.offset.left+M+a.dimension.width+12;var A=a.offset.top+p-(a.offset.top+a.dimension.height);if(O=a.offset.top-A/2-H,0>I&&S+l>r){var z=2*parseFloat(n.$tooltip.css("border-width")),F=l+I-z;n.$tooltip.css("width",F+"px"),p=n.$tooltip.outerHeight(!1),I=a.offset.left-M-F-12-z,A=a.offset.top+p-(a.offset.top+a.dimension.height),O=a.offset.top-A/2-H}else 0>I&&(I=a.offset.left+M+a.dimension.width+12,s="left")}if("right"==D){I=a.offset.left+M+a.dimension.width+12,S=a.offset.left-M-l-12;var A=a.offset.top+p-(a.offset.top+a.dimension.height);if(O=a.offset.top-A/2-H,I+l>r&&0>S){var z=2*parseFloat(n.$tooltip.css("border-width")),F=r-I-z;n.$tooltip.css("width",F+"px"),p=n.$tooltip.outerHeight(!1),A=a.offset.top+p-(a.offset.top+a.dimension.height),O=a.offset.top-A/2-H}else I+l>r&&(I=a.offset.left-M-l-12,s="right")}if(n.options.arrow){var N="tooltipster-arrow-"+D;if(n.options.arrowColor.length<1)var X=n.$tooltip.css("background-color");else var X=n.options.arrowColor;if(s?"left"==s?(N="tooltipster-arrow-right",s=""):"right"==s?(N="tooltipster-arrow-left",s=""):s="left:"+Math.round(s)+"px;":s="","top"==D||"top-left"==D||"top-right"==D)var q=parseFloat(n.$tooltip.css("border-bottom-width")),j=n.$tooltip.css("border-bottom-color");else if("bottom"==D||"bottom-left"==D||"bottom-right"==D)var q=parseFloat(n.$tooltip.css("border-top-width")),j=n.$tooltip.css("border-top-color");else if("left"==D)var q=parseFloat(n.$tooltip.css("border-right-width")),j=n.$tooltip.css("border-right-color");else if("right"==D)var q=parseFloat(n.$tooltip.css("border-left-width")),j=n.$tooltip.css("border-left-color");else var q=parseFloat(n.$tooltip.css("border-bottom-width")),j=n.$tooltip.css("border-bottom-color");q>1&&q++;var E="";if(0!==q){var L="",Q="border-color: "+j+";";-1!==N.indexOf("bottom")?L="margin-top: -"+Math.round(q)+"px;":-1!==N.indexOf("top")?L="margin-bottom: -"+Math.round(q)+"px;":-1!==N.indexOf("left")?L="margin-right: -"+Math.round(q)+"px;":-1!==N.indexOf("right")&&(L="margin-left: -"+Math.round(q)+"px;"),E='<span class="tooltipster-arrow-border" style="'+L+" "+Q+';"></span>'}n.$tooltip.find(".tooltipster-arrow").remove();var U='<div class="'+N+' tooltipster-arrow" style="'+s+'">'+E+'<span style="border-color:'+X+';"></span></div>';n.$tooltip.append(U)}n.$tooltip.css({top:Math.round(O)+"px",left:Math.round(I)+"px"})}return n},enable:function(){return this.enabled=!0,this},disable:function(){return this.hide(),this.enabled=!1,this},destroy:function(){var o=this;o.hide(),o.$el[0]!==o.$elProxy[0]&&o.$elProxy.remove(),o.$el.removeData(o.namespace).off("."+o.namespace);var e=o.$el.data("tooltipster-ns");if(1===e.length){var i="string"==typeof o.Content?o.Content:t("<div></div>").append(o.Content).html();o.$el.removeClass("tooltipstered").attr("title",i).removeData(o.namespace).removeData("tooltipster-ns").off("."+o.namespace)}else e=t.grep(e,function(t,e){return t!==o.namespace}),o.$el.data("tooltipster-ns",e);return o},elementIcon:function(){return this.$el[0]!==this.$elProxy[0]?this.$elProxy[0]:void 0},elementTooltip:function(){return this.$tooltip?this.$tooltip[0]:void 0},option:function(t,o){return"undefined"==typeof o?this.options[t]:(this.options[t]=o,this)},status:function(){return this.Status}},t.fn[a]=function(){var o=arguments;if(0===this.length){if("string"==typeof o[0]){var e=!0;switch(o[0]){case"setDefaults":t.extend(l,o[1]);break;default:e=!1}return e?!0:this}return this}if("string"==typeof o[0]){var n="#*$~&";return this.each(function(){var e=t(this).data("tooltipster-ns"),i=e?t(this).data(e[0]):null;if(!i)throw new Error("You called Tooltipster's \""+o[0]+'" method on an uninitialized element');if("function"!=typeof i[o[0]])throw new Error('Unknown method .tooltipster("'+o[0]+'")');var s=i[o[0]](o[1],o[2]);return s!==i?(n=s,!1):void 0}),"#*$~&"!==n?n:this}var s=[],r=o[0]&&"undefined"!=typeof o[0].multiple,a=r&&o[0].multiple||!r&&l.multiple,p=o[0]&&"undefined"!=typeof o[0].debug,f=p&&o[0].debug||!p&&l.debug;return this.each(function(){var e=!1,n=t(this).data("tooltipster-ns"),r=null;n?a?e=!0:f&&console.log('Tooltipster: one or more tooltips are already attached to this element: ignoring. Use the "multiple" option to attach more tooltips.'):e=!0,e&&(r=new i(this,o[0]),n||(n=[]),n.push(r.namespace),t(this).data("tooltipster-ns",n),t(this).data(r.namespace,r)),s.push(r)}),a?s:this};var p=!!("ontouchstart"in o),f=!1;t("body").one("mousemove",function(){f=!0})}(jQuery,window,document);