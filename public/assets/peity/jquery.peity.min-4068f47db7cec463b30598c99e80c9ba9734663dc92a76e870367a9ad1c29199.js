!function(t,i,e,n){var r=function(e,n){return t(i.createElementNS("http://www.w3.org/2000/svg",e)).attr(n)},a="createElementNS"in i&&r("svg",{})[0].createSVGRect,h=t.fn.peity=function(i,e){return a&&this.each(function(){var n=t(this),r=n.data("_peity");r?(i&&(r.type=i),t.extend(r.opts,e)):(r=new s(n,i,t.extend({},h.defaults[i],n.data("peity"),e)),n.change(function(){r.draw()}).data("_peity",r)),r.draw()}),this},s=function(t,i,e){this.$el=t,this.type=i,this.opts=e},l=s.prototype;l.draw=function(){h.graphers[this.type].call(this,this.opts)},l.fill=function(){var i=this.opts.fill;return t.isFunction(i)?i:function(t,e){return i[e%i.length]}},l.prepare=function(t,i){return this.$svg||this.$el.hide().after(this.$svg=r("svg",{"class":"peity"})),this.$svg.empty().data("peity",this).attr({height:i,width:t})},l.values=function(){return t.map(this.$el.text().split(this.opts.delimiter),function(t){return parseFloat(t)})},h.defaults={},h.graphers={},h.register=function(t,i,e){this.defaults[t]=i,this.graphers[t]=e},h.register("pie",{fill:["#ff9900","#fff4dd","#ffc66e"],radius:8},function(i){if(!i.delimiter){var n=this.$el.text().match(/[^0-9\.]/);i.delimiter=n?n[0]:","}if(n=t.map(this.values(),function(t){return t>0?t:0}),"/"==i.delimiter)var a=n[0],n=[a,e.max(0,n[1]-a)];for(var h=0,a=n.length,s=0;a>h;h++)s+=n[h];s||(a=2,s=1,n=[0,1]);var l=2*i.radius,l=this.prepare(i.width||l,i.height||l),h=l.width(),p=l.height(),o=h/2,c=p/2,p=e.min(o,c),i=i.innerRadius;"donut"==this.type&&!i&&(i=.5*p);for(var f=e.PI,u=this.fill(),d=this.scale=function(t,i){var n=t/s*f*2-f/2;return[i*e.cos(n)+o,i*e.sin(n)+c]},g=0,h=0;a>h;h++){var m=n[h],v=m/s;if(0!=v){if(1==v)if(i)var v=o-.01,y=c-p,w=c-i,v=r("path",{d:["M",o,y,"A",p,p,0,1,1,v,y,"L",v,w,"A",i,i,0,1,0,o,w].join(" ")});else v=r("circle",{cx:o,cy:c,r:p});else y=g+m,w=["M"].concat(d(g,p),"A",p,p,0,v>.5?1:0,1,d(y,p),"L"),i?w=w.concat(d(y,i),"A",i,i,0,v>.5?1:0,0,d(g,i)):w.push(o,c),g+=m,v=r("path",{d:w.join(" ")});v.attr("fill",u.call(this,m,h,n)),l.append(v)}}}),h.register("donut",t.extend(!0,{},h.defaults.pie),function(t){h.graphers.pie.call(this,t)}),h.register("line",{delimiter:",",fill:"#c6d9fd",height:16,min:0,stroke:"#4d89f9",strokeWidth:1,width:32},function(t){var i=this.values();1==i.length&&i.push(i[0]);for(var a=e.max.apply(e,t.max==n?i:i.concat(t.max)),h=e.min.apply(e,t.min==n?i:i.concat(t.min)),s=this.prepare(t.width,t.height),l=t.strokeWidth,p=s.width(),o=s.height()-l,c=a-h,a=this.x=function(t){return t*(p/(i.length-1))},f=this.y=function(t){var i=o;return c&&(i-=(t-h)/c*o),i+l/2},u=f(e.max(h,0)),d=[0,u],g=0;g<i.length;g++)d.push(a(g),f(i[g]));d.push(p,u),s.append(r("polygon",{fill:t.fill,points:d.join(" ")})),l&&s.append(r("polyline",{fill:"transparent",points:d.slice(2,d.length-2).join(" "),stroke:t.stroke,"stroke-width":l,"stroke-linecap":"square"}))}),h.register("bar",{delimiter:",",fill:["#4D89F9"],height:16,min:0,padding:.1,width:32},function(t){for(var i=this.values(),a=e.max.apply(e,t.max==n?i:i.concat(t.max)),h=e.min.apply(e,t.min==n?i:i.concat(t.min)),s=this.prepare(t.width,t.height),l=s.width(),p=s.height(),o=a-h,t=t.padding,c=this.fill(),f=this.x=function(t){return t*l/i.length},u=this.y=function(t){return p-(o?(t-h)/o*p:1)},d=0;d<i.length;d++){var g,m=f(d+t),v=f(d+1-t)-m,y=i[d],w=u(y),x=w;o?0>y?x=u(e.min(a,0)):w=u(e.max(h,0)):g=1,g=w-x,0==g&&(g=1,a>0&&o&&x--),s.append(r("rect",{fill:c.call(this,y,d,i),x:m,y:x,width:v,height:g}))}})}(jQuery,document,Math);