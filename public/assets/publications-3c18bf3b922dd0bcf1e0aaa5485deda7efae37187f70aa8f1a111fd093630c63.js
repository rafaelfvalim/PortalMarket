(function(){window.countNews=function(t){return $("#visited-"+t).text("Visited").toggleClass("label label-primary label label-success"),$.ajax({type:"GET",url:"/publications/get_news_count.json",data:{id:t},success:function(t){return $("#count-new").text(""),$("#count-new").text("News "+t)},errors:function(t){return alert("error on get count news")}})}}).call(this);