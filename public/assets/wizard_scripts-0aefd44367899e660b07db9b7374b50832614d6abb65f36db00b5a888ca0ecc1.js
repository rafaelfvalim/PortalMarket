(function(){var e,t,a,r,s,n,c,i,l,o;e={START:"start",GENERATELIST:"generate list",FINAL:"final"},o=e.START,s=1,t=[],c=function(e){return $("#"+e).remove()},window.process_call_ajax=function(e,t){return console.log("chamou o process modules"),$.ajax({type:"GET",url:"/process_modules/"+e+"/get_list_ajax.json",data:{id:e},success:function(e){return n($("#list_process_chain"),e,t)},errors:function(e){return alert("error")}})},n=function(t,r,s){var n,c;return c=parseInt($(s).attr("data-level"),10),n=$(s).attr("id"),$("#list_process_chain [data-level='"+c+"'] #process_id").val(n),$("#list_process_chain").scrollTo(s),a(c),$.isEmptyObject(r)?(i(t,n),o=e.FINAL):(l(t,r),o=e.GENERATELIST)},i=function(e,a){var r,n,c,i;return c=a,(null===c||""===c)&&(c=$("#process_id").val()),r=$('<div class="col-xs-6 col-sm-4 col-md-3 col-md-2 value_chain">'),r.attr("data-level",s),n=$('<div class ="finish_process">'),i=$('<input type="submit" value="Finish"  class="btn btn-success"/>'),n.append(i),r.append(n),s++,t.push(r),e.append(r)},r=function(e,t,a){return"edit"===e?"/value_chains/create_ajax/"+t+"/"+a+"/edit":"/value_ chains/create_ajax/"+t+"/"+a+"/create"},l=function(e,a){var r,n,c,i;return n=$('<div class="col-md-3">'),n.attr("data-level",s),r=$('<div class="list-group">'),r.attr("data-level",s),c=$('<ul class="list-unstyled">'),i=$('<input type="hidden" id="process_id" name="process[][id]">'),$.each(a,function(e,t){var a,r;return r=$("<li>"),a=$('<a href="#">'),a.text(t.description),a.attr("id",t.id),a.attr("data-level",s),a.attr("class","list-group-item"),a.attr("onclick","process_call_ajax("+t.id+", this)"),r.append(a),c.append(r)}),r.append(c),r.append(i),n.append(r),s++,t.push(n),$(e).append(n)},a=function(e){return t.forEach(function(t){var a;return a=parseInt($(t).attr("data-level"),10),a>e?$(t).remove():void 0})},$(function(){var e;0===$(".breadcrumb").length?$("#process_badge").text(0):$("#process_badge").text($(".breadcrumb").length),$("#value_chain_process").length&&process_call_ajax($("#process_id").val()),$("#value_chain_process a").click(function(e){return a(1)}),e=function(e){switch(e){case"step1":return $("#progressbar").width("0%");case"step2":return $("#progressbar").width("30%");case"step3":return $("#progressbar").width("50%");case"step4":return $("#progressbar").width("70%");case"step5":return $("#progressbar").width("100%")}},$('a[data-toggle="tab"]').click(function(t){var a;return a=$(t.target).attr("href"),e(a.substring(1,a.length))}),$(".next").click(function(){var t;return t=$(this).parents(".tab-pane").next().attr("id"),e(t),$("[href=#"+t+"]").tab("show")})})}).call(this);