function localStorageSupport(){return"localStorage"in window&&null!==window.localStorage}function animationHover(e,a){e=$(e),e.hover(function(){e.addClass("animated "+a)},function(){window.setTimeout(function(){e.removeClass("animated "+a)},2e3)})}function SmoothlyMenu(){!$("body").hasClass("mini-navbar")||$("body").hasClass("body-small")?($("#side-menu").hide(),setTimeout(function(){$("#side-menu").fadeIn(500)},100)):$("body").hasClass("fixed-sidebar")?($("#side-menu").hide(),setTimeout(function(){$("#side-menu").fadeIn(500)},300)):$("#side-menu").removeAttr("style")}$(document).ready(function(){function e(){var e=$("body > #wrapper").height()-61;$(".sidebard-panel").css("min-height",e+"px");var a=$("nav.navbar-default").height(),o=$("#page-wrapper").height();a>o&&$("#page-wrapper").css("min-height",a+"px"),o>a&&$("#page-wrapper").css("min-height",$(window).height()+"px"),$("body").hasClass("fixed-nav")&&$("#page-wrapper").css("min-height",$(window).height()-60+"px")}$(this).width()<769?$("body").addClass("body-small"):$("body").removeClass("body-small"),$("#side-menu").metisMenu(),$(".collapse-link").click(function(){var e=$(this).closest("div.ibox"),a=$(this).find("i"),o=e.find("div.ibox-content");o.slideToggle(200),a.toggleClass("fa-chevron-up").toggleClass("fa-chevron-down"),e.toggleClass("").toggleClass("border-bottom"),setTimeout(function(){e.resize(),e.find("[id^=map-]").resize()},50)}),$(".close-link").click(function(){var e=$(this).closest("div.ibox");e.remove()}),$(".fullscreen-link").click(function(){var e=$(this).closest("div.ibox"),a=$(this).find("i");$("body").toggleClass("fullscreen-ibox-mode"),a.toggleClass("fa-expand").toggleClass("fa-compress"),e.toggleClass("fullscreen"),setTimeout(function(){$(window).trigger("resize")},100)}),$(".close-canvas-menu").click(function(){$("body").toggleClass("mini-navbar"),SmoothlyMenu()}),$(".right-sidebar-toggle").click(function(){$("#right-sidebar").toggleClass("sidebar-open")}),$(".sidebar-container").slimScroll({height:"100%",railOpacity:.4,wheelStep:10}),$(".open-small-chat").click(function(){$(this).children().toggleClass("fa-comments").toggleClass("fa-remove"),$(".small-chat-box").toggleClass("active")}),$(".small-chat-box .content").slimScroll({height:"234px",railOpacity:.4}),$(".check-link").click(function(){var e=$(this).find("i"),a=$(this).next("span");return e.toggleClass("fa-check-square").toggleClass("fa-square-o"),a.toggleClass("todo-completed"),!1}),$(".navbar-minimalize").click(function(){$("body").toggleClass("mini-navbar"),SmoothlyMenu()}),$(".tooltip-demo").tooltip({selector:"[data-toggle=tooltip]",container:"body"}),$(".modal").appendTo("body"),e(),$(window).bind("load",function(){$("body").hasClass("fixed-sidebar")&&$(".sidebar-collapse").slimScroll({height:"100%",railOpacity:.9})}),$(window).scroll(function(){$(window).scrollTop()>0&&!$("body").hasClass("fixed-nav")?$("#right-sidebar").addClass("sidebar-top"):$("#right-sidebar").removeClass("sidebar-top")}),$(window).bind("load resize scroll",function(){$("body").hasClass("body-small")||e()}),$("[data-toggle=popover]").popover(),$(".full-height-scroll").slimscroll({height:"100%"})}),$(window).bind("resize",function(){$(this).width()<769?$("body").addClass("body-small"):$("body").removeClass("body-small")}),$(document).ready(function(){if(localStorageSupport){var e=localStorage.getItem("collapse_menu"),a=localStorage.getItem("fixedsidebar"),o=localStorage.getItem("fixednavbar"),s=localStorage.getItem("boxedlayout"),i=localStorage.getItem("fixedfooter"),l=$("body");"on"==a&&(l.addClass("fixed-sidebar"),$(".sidebar-collapse").slimScroll({height:"100%",railOpacity:.9})),"on"==e&&(l.hasClass("fixed-sidebar")?l.hasClass("body-small")||l.addClass("mini-navbar"):l.hasClass("body-small")||l.addClass("mini-navbar")),"on"==o&&($(".navbar-static-top").removeClass("navbar-static-top").addClass("navbar-fixed-top"),l.addClass("fixed-nav")),"on"==s&&l.addClass("boxed-layout"),"on"==i&&$(".footer").addClass("fixed")}});