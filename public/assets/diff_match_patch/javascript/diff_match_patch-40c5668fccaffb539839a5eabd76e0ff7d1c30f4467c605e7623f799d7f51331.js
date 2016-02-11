!function(){function t(){this.Diff_Timeout=1,this.Diff_EditCost=4,this.Match_Threshold=.5,this.Match_Distance=1e3,this.Patch_DeleteThreshold=.5,this.Patch_Margin=4,this.Match_MaxBits=32}t.prototype.diff_main=function(t,e,n,i){if("undefined"==typeof i&&(i=0>=this.Diff_Timeout?Number.MAX_VALUE:(new Date).getTime()+1e3*this.Diff_Timeout),null==t||null==e)throw Error("Null input. (diff_main)");if(t==e)return t?[[0,t]]:[];"undefined"==typeof n&&(n=!0);var r=n,h=this.diff_commonPrefix(t,e);n=t.substring(0,h),t=t.substring(h),e=e.substring(h);var h=this.diff_commonSuffix(t,e),s=t.substring(t.length-h);return t=t.substring(0,t.length-h),e=e.substring(0,e.length-h),t=this.diff_compute_(t,e,r,i),n&&t.unshift([0,n]),s&&t.push([0,s]),this.diff_cleanupMerge(t),t},t.prototype.diff_compute_=function(t,e,n,i){if(!t)return[[1,e]];if(!e)return[[-1,t]];var r=t.length>e.length?t:e,h=t.length>e.length?e:t,s=r.indexOf(h);return-1!=s?(n=[[1,r.substring(0,s)],[0,h],[1,r.substring(s+h.length)]],t.length>e.length&&(n[0][0]=n[2][0]=-1),n):1==h.length?[[-1,t],[1,e]]:(r=this.diff_halfMatch_(t,e))?(h=r[0],t=r[1],s=r[2],e=r[3],r=r[4],h=this.diff_main(h,s,n,i),n=this.diff_main(t,e,n,i),h.concat([[0,r]],n)):n&&100<t.length&&100<e.length?this.diff_lineMode_(t,e,i):this.diff_bisect_(t,e,i)},t.prototype.diff_lineMode_=function(t,e,n){var i=this.diff_linesToChars_(t,e);t=i.chars1,e=i.chars2,i=i.lineArray,t=this.diff_main(t,e,!1,n),this.diff_charsToLines_(t,i),this.diff_cleanupSemantic(t),t.push([0,""]);for(var r=i=e=0,h="",s="";e<t.length;){switch(t[e][0]){case 1:r++,s+=t[e][1];break;case-1:i++,h+=t[e][1];break;case 0:if(i>=1&&r>=1){for(t.splice(e-i-r,i+r),e=e-i-r,i=this.diff_main(h,s,!1,n),r=i.length-1;r>=0;r--)t.splice(e,0,i[r]);e+=i.length}i=r=0,s=h=""}e++}return t.pop(),t},t.prototype.diff_bisect_=function(t,e,n){for(var i=t.length,r=e.length,h=Math.ceil((i+r)/2),s=h,f=2*h,a=Array(f),l=Array(f),g=0;f>g;g++)a[g]=-1,l[g]=-1;a[s+1]=0,l[s+1]=0;for(var g=i-r,o=0!=g%2,c=0,u=0,p=0,d=0,_=0;h>_&&!((new Date).getTime()>n);_++){for(var b=-_+c;_-u>=b;b+=2){var m,v=s+b;m=b==-_||b!=_&&a[v-1]<a[v+1]?a[v+1]:a[v-1]+1;for(var M=m-b;i>m&&r>M&&t.charAt(m)==e.charAt(M);)m++,M++;if(a[v]=m,m>i)u+=2;else if(M>r)c+=2;else if(o&&(v=s+g-b,v>=0&&f>v&&-1!=l[v])){var x=i-l[v];if(m>=x)return this.diff_bisectSplit_(t,e,m,M,n)}}for(b=-_+p;_-d>=b;b+=2){for(v=s+b,x=b==-_||b!=_&&l[v-1]<l[v+1]?l[v+1]:l[v-1]+1,m=x-b;i>x&&r>m&&t.charAt(i-x-1)==e.charAt(r-m-1);)x++,m++;if(l[v]=x,x>i)d+=2;else if(m>r)p+=2;else if(!o&&(v=s+g-b,v>=0&&f>v&&-1!=a[v]&&(m=a[v],M=s+m-v,x=i-x,m>=x)))return this.diff_bisectSplit_(t,e,m,M,n)}}return[[-1,t],[1,e]]},t.prototype.diff_bisectSplit_=function(t,e,n,i,r){var h=t.substring(0,n),s=e.substring(0,i);return t=t.substring(n),e=e.substring(i),h=this.diff_main(h,s,!1,r),r=this.diff_main(t,e,!1,r),h.concat(r)},t.prototype.diff_linesToChars_=function(t,e){function n(t){for(var e="",n=0,h=-1,s=i.length;h<t.length-1;){h=t.indexOf("\n",n),-1==h&&(h=t.length-1);var f=t.substring(n,h+1),n=h+1;(r.hasOwnProperty?r.hasOwnProperty(f):void 0!==r[f])?e+=String.fromCharCode(r[f]):(e+=String.fromCharCode(s),r[f]=s,i[s++]=f)}return e}var i=[],r={};i[0]="";var h=n(t),s=n(e);return{chars1:h,chars2:s,lineArray:i}},t.prototype.diff_charsToLines_=function(t,e){for(var n=0;n<t.length;n++){for(var i=t[n][1],r=[],h=0;h<i.length;h++)r[h]=e[i.charCodeAt(h)];t[n][1]=r.join("")}},t.prototype.diff_commonPrefix=function(t,e){if(!t||!e||t.charAt(0)!=e.charAt(0))return 0;for(var n=0,i=Math.min(t.length,e.length),r=i,h=0;r>n;)t.substring(h,r)==e.substring(h,r)?h=n=r:i=r,r=Math.floor((i-n)/2+n);return r},t.prototype.diff_commonSuffix=function(t,e){if(!t||!e||t.charAt(t.length-1)!=e.charAt(e.length-1))return 0;for(var n=0,i=Math.min(t.length,e.length),r=i,h=0;r>n;)t.substring(t.length-r,t.length-h)==e.substring(e.length-r,e.length-h)?h=n=r:i=r,r=Math.floor((i-n)/2+n);return r},t.prototype.diff_commonOverlap_=function(t,e){var n=t.length,i=e.length;if(0==n||0==i)return 0;if(n>i?t=t.substring(n-i):i>n&&(e=e.substring(0,n)),n=Math.min(n,i),t==e)return n;for(var i=0,r=1;;){var h=t.substring(n-r),h=e.indexOf(h);if(-1==h)return i;r+=h,(0==h||t.substring(n-r)==e.substring(0,r))&&(i=r,r++)}},t.prototype.diff_halfMatch_=function(t,e){function n(t,e,n){for(var i,r,h,f,a=t.substring(n,n+Math.floor(t.length/4)),l=-1,g="";-1!=(l=e.indexOf(a,l+1));){var o=s.diff_commonPrefix(t.substring(n),e.substring(l)),c=s.diff_commonSuffix(t.substring(0,n),e.substring(0,l));g.length<c+o&&(g=e.substring(l-c,l)+e.substring(l,l+o),i=t.substring(0,n-c),r=t.substring(n+o),h=e.substring(0,l-c),f=e.substring(l+o))}return 2*g.length>=t.length?[i,r,h,f,g]:null}if(0>=this.Diff_Timeout)return null;var i=t.length>e.length?t:e,r=t.length>e.length?e:t;if(4>i.length||2*r.length<i.length)return null;var h,s=this,f=n(i,r,Math.ceil(i.length/4)),i=n(i,r,Math.ceil(i.length/2));if(!f&&!i)return null;h=i?f&&f[4].length>i[4].length?f:i:f;var a;return t.length>e.length?(f=h[0],i=h[1],r=h[2],a=h[3]):(r=h[0],a=h[1],f=h[2],i=h[3]),h=h[4],[f,i,r,a,h]},t.prototype.diff_cleanupSemantic=function(t){for(var e=!1,n=[],i=0,r=null,h=0,s=0,f=0,a=0,l=0;h<t.length;)0==t[h][0]?(n[i++]=h,s=a,f=l,l=a=0,r=t[h][1]):(1==t[h][0]?a+=t[h][1].length:l+=t[h][1].length,r&&r.length<=Math.max(s,f)&&r.length<=Math.max(a,l)&&(t.splice(n[i-1],0,[-1,r]),t[n[i-1]+1][0]=1,i--,i--,h=i>0?n[i-1]:-1,l=a=f=s=0,r=null,e=!0)),h++;for(e&&this.diff_cleanupMerge(t),this.diff_cleanupSemanticLossless(t),h=1;h<t.length;)-1==t[h-1][0]&&1==t[h][0]&&(e=t[h-1][1],n=t[h][1],i=this.diff_commonOverlap_(e,n),r=this.diff_commonOverlap_(n,e),i>=r?(i>=e.length/2||i>=n.length/2)&&(t.splice(h,0,[0,n.substring(0,i)]),t[h-1][1]=e.substring(0,e.length-i),t[h+1][1]=n.substring(i),h++):(r>=e.length/2||r>=n.length/2)&&(t.splice(h,0,[0,e.substring(0,r)]),t[h-1][0]=1,t[h-1][1]=n.substring(0,n.length-r),t[h+1][0]=-1,t[h+1][1]=e.substring(r),h++),h++),h++},t.prototype.diff_cleanupSemanticLossless=function(e){function n(e,n){if(!e||!n)return 6;var i=e.charAt(e.length-1),r=n.charAt(0),h=i.match(t.nonAlphaNumericRegex_),s=r.match(t.nonAlphaNumericRegex_),f=h&&i.match(t.whitespaceRegex_),a=s&&r.match(t.whitespaceRegex_),i=f&&i.match(t.linebreakRegex_),r=a&&r.match(t.linebreakRegex_),l=i&&e.match(t.blanklineEndRegex_),g=r&&n.match(t.blanklineStartRegex_);return l||g?5:i||r?4:h&&!f&&a?3:f||a?2:h||s?1:0}for(var i=1;i<e.length-1;){if(0==e[i-1][0]&&0==e[i+1][0]){var r=e[i-1][1],h=e[i][1],s=e[i+1][1],f=this.diff_commonSuffix(r,h);if(f)var a=h.substring(h.length-f),r=r.substring(0,r.length-f),h=a+h.substring(0,h.length-f),s=a+s;for(var f=r,a=h,l=s,g=n(r,h)+n(h,s);h.charAt(0)===s.charAt(0);){var r=r+h.charAt(0),h=h.substring(1)+s.charAt(0),s=s.substring(1),o=n(r,h)+n(h,s);o>=g&&(g=o,f=r,a=h,l=s)}e[i-1][1]!=f&&(f?e[i-1][1]=f:(e.splice(i-1,1),i--),e[i][1]=a,l?e[i+1][1]=l:(e.splice(i+1,1),i--))}i++}},t.nonAlphaNumericRegex_=/[^a-zA-Z0-9]/,t.whitespaceRegex_=/\s/,t.linebreakRegex_=/[\r\n]/,t.blanklineEndRegex_=/\n\r?\n$/,t.blanklineStartRegex_=/^\r?\n\r?\n/,t.prototype.diff_cleanupEfficiency=function(t){for(var e=!1,n=[],i=0,r=null,h=0,s=!1,f=!1,a=!1,l=!1;h<t.length;)0==t[h][0]?(t[h][1].length<this.Diff_EditCost&&(a||l)?(n[i++]=h,s=a,f=l,r=t[h][1]):(i=0,r=null),a=l=!1):(-1==t[h][0]?l=!0:a=!0,r&&(s&&f&&a&&l||r.length<this.Diff_EditCost/2&&3==s+f+a+l)&&(t.splice(n[i-1],0,[-1,r]),t[n[i-1]+1][0]=1,i--,r=null,s&&f?(a=l=!0,i=0):(i--,h=i>0?n[i-1]:-1,a=l=!1),e=!0)),h++;e&&this.diff_cleanupMerge(t)},t.prototype.diff_cleanupMerge=function(t){t.push([0,""]);for(var e,n=0,i=0,r=0,h="",s="";n<t.length;)switch(t[n][0]){case 1:r++,s+=t[n][1],n++;break;case-1:i++,h+=t[n][1],n++;break;case 0:i+r>1?(0!==i&&0!==r&&(e=this.diff_commonPrefix(s,h),0!==e&&(n-i-r>0&&0==t[n-i-r-1][0]?t[n-i-r-1][1]+=s.substring(0,e):(t.splice(0,0,[0,s.substring(0,e)]),n++),s=s.substring(e),h=h.substring(e)),e=this.diff_commonSuffix(s,h),0!==e&&(t[n][1]=s.substring(s.length-e)+t[n][1],s=s.substring(0,s.length-e),h=h.substring(0,h.length-e))),0===i?t.splice(n-r,i+r,[1,s]):0===r?t.splice(n-i,i+r,[-1,h]):t.splice(n-i-r,i+r,[-1,h],[1,s]),n=n-i-r+(i?1:0)+(r?1:0)+1):0!==n&&0==t[n-1][0]?(t[n-1][1]+=t[n][1],t.splice(n,1)):n++,i=r=0,s=h=""}for(""===t[t.length-1][1]&&t.pop(),i=!1,n=1;n<t.length-1;)0==t[n-1][0]&&0==t[n+1][0]&&(t[n][1].substring(t[n][1].length-t[n-1][1].length)==t[n-1][1]?(t[n][1]=t[n-1][1]+t[n][1].substring(0,t[n][1].length-t[n-1][1].length),t[n+1][1]=t[n-1][1]+t[n+1][1],t.splice(n-1,1),i=!0):t[n][1].substring(0,t[n+1][1].length)==t[n+1][1]&&(t[n-1][1]+=t[n+1][1],t[n][1]=t[n][1].substring(t[n+1][1].length)+t[n+1][1],t.splice(n+1,1),i=!0)),n++;i&&this.diff_cleanupMerge(t)},t.prototype.diff_xIndex=function(t,e){var n,i=0,r=0,h=0,s=0;for(n=0;n<t.length&&(1!==t[n][0]&&(i+=t[n][1].length),-1!==t[n][0]&&(r+=t[n][1].length),!(i>e));n++)h=i,s=r;return t.length!=n&&-1===t[n][0]?s:s+(e-h)},t.prototype.diff_prettyHtml=function(t){for(var e=[],n=/&/g,i=/</g,r=/>/g,h=/\n/g,s=0;s<t.length;s++){var f=t[s][0],a=t[s][1],a=a.replace(n,"&amp;").replace(i,"&lt;").replace(r,"&gt;").replace(h,"&para;<br>");switch(f){case 1:e[s]='<ins style="background:#e6ffe6;">'+a+"</ins>";break;case-1:e[s]='<del style="background:#ffe6e6;">'+a+"</del>";break;case 0:e[s]="<span>"+a+"</span>"}}return e.join("")},t.prototype.diff_text1=function(t){for(var e=[],n=0;n<t.length;n++)1!==t[n][0]&&(e[n]=t[n][1]);return e.join("")},t.prototype.diff_text2=function(t){for(var e=[],n=0;n<t.length;n++)-1!==t[n][0]&&(e[n]=t[n][1]);return e.join("")},t.prototype.diff_levenshtein=function(t){for(var e=0,n=0,i=0,r=0;r<t.length;r++){var h=t[r][0],s=t[r][1];switch(h){case 1:n+=s.length;break;case-1:i+=s.length;break;case 0:e+=Math.max(n,i),i=n=0}}return e+=Math.max(n,i)},t.prototype.diff_toDelta=function(t){for(var e=[],n=0;n<t.length;n++)switch(t[n][0]){case 1:e[n]="+"+encodeURI(t[n][1]);break;case-1:e[n]="-"+t[n][1].length;break;case 0:e[n]="="+t[n][1].length}return e.join("	").replace(/%20/g," ")},t.prototype.diff_fromDelta=function(t,e){for(var n=[],i=0,r=0,h=e.split(/\t/g),s=0;s<h.length;s++){var f=h[s].substring(1);switch(h[s].charAt(0)){case"+":try{n[i++]=[1,decodeURI(f)]}catch(a){throw Error("Illegal escape in diff_fromDelta: "+f)}break;case"-":case"=":var l=parseInt(f,10);if(isNaN(l)||0>l)throw Error("Invalid number in diff_fromDelta: "+f);f=t.substring(r,r+=l),"="==h[s].charAt(0)?n[i++]=[0,f]:n[i++]=[-1,f];break;default:if(h[s])throw Error("Invalid diff operation in diff_fromDelta: "+h[s])}}if(r!=t.length)throw Error("Delta length ("+r+") does not equal source text length ("+t.length+").");return n},t.prototype.match_main=function(t,e,n){if(null==t||null==e||null==n)throw Error("Null input. (match_main)");return n=Math.max(0,Math.min(n,t.length)),t==e?0:t.length?t.substring(n,n+e.length)==e?n:this.match_bitap_(t,e,n):-1},t.prototype.match_bitap_=function(t,e,n){function i(t,i){var r=t/e.length,s=Math.abs(n-i);return h.Match_Distance?r+s/h.Match_Distance:s?1:r}if(e.length>this.Match_MaxBits)throw Error("Pattern too long for this browser.");var r=this.match_alphabet_(e),h=this,s=this.Match_Threshold,f=t.indexOf(e,n);-1!=f&&(s=Math.min(i(0,f),s),f=t.lastIndexOf(e,n+e.length),-1!=f&&(s=Math.min(i(0,f),s)));for(var a,l,g,o=1<<e.length-1,f=-1,c=e.length+t.length,u=0;u<e.length;u++){for(a=0,l=c;l>a;)i(u,n+l)<=s?a=l:c=l,l=Math.floor((c-a)/2+a);c=l,a=Math.max(1,n-l+1);var p=Math.min(n+l,t.length)+e.length;for(l=Array(p+2),l[p+1]=(1<<u)-1;p>=a;p--){var d=r[t.charAt(p-1)];if(l[p]=0===u?(l[p+1]<<1|1)&d:(l[p+1]<<1|1)&d|((g[p+1]|g[p])<<1|1)|g[p+1],l[p]&o&&(d=i(u,p-1),s>=d)){if(s=d,f=p-1,!(f>n))break;a=Math.max(1,2*n-f)}}if(i(u+1,n)>s)break;g=l}return f},t.prototype.match_alphabet_=function(t){for(var e={},n=0;n<t.length;n++)e[t.charAt(n)]=0;for(n=0;n<t.length;n++)e[t.charAt(n)]|=1<<t.length-n-1;return e},t.prototype.patch_addContext_=function(t,e){if(0!=e.length){for(var n=e.substring(t.start2,t.start2+t.length1),i=0;e.indexOf(n)!=e.lastIndexOf(n)&&n.length<this.Match_MaxBits-this.Patch_Margin-this.Patch_Margin;)i+=this.Patch_Margin,n=e.substring(t.start2-i,t.start2+t.length1+i);i+=this.Patch_Margin,(n=e.substring(t.start2-i,t.start2))&&t.diffs.unshift([0,n]),(i=e.substring(t.start2+t.length1,t.start2+t.length1+i))&&t.diffs.push([0,i]),t.start1-=n.length,t.start2-=n.length,t.length1+=n.length+i.length,t.length2+=n.length+i.length}},t.prototype.patch_make=function(e,n,i){var r;if("string"==typeof e&&"string"==typeof n&&"undefined"==typeof i)r=e,n=this.diff_main(r,n,!0),2<n.length&&(this.diff_cleanupSemantic(n),this.diff_cleanupEfficiency(n));else if(e&&"object"==typeof e&&"undefined"==typeof n&&"undefined"==typeof i)n=e,r=this.diff_text1(n);else if("string"==typeof e&&n&&"object"==typeof n&&"undefined"==typeof i)r=e;else{if("string"!=typeof e||"string"!=typeof n||!i||"object"!=typeof i)throw Error("Unknown call format to patch_make.");r=e,n=i}if(0===n.length)return[];i=[],e=new t.patch_obj;for(var h=0,s=0,f=0,a=r,l=0;l<n.length;l++){var g=n[l][0],o=n[l][1];switch(!h&&0!==g&&(e.start1=s,e.start2=f),g){case 1:e.diffs[h++]=n[l],e.length2+=o.length,r=r.substring(0,f)+o+r.substring(f);break;case-1:e.length1+=o.length,e.diffs[h++]=n[l],r=r.substring(0,f)+r.substring(f+o.length);break;case 0:o.length<=2*this.Patch_Margin&&h&&n.length!=l+1?(e.diffs[h++]=n[l],e.length1+=o.length,e.length2+=o.length):o.length>=2*this.Patch_Margin&&h&&(this.patch_addContext_(e,a),i.push(e),e=new t.patch_obj,h=0,a=r,s=f)}1!==g&&(s+=o.length),-1!==g&&(f+=o.length)}return h&&(this.patch_addContext_(e,a),i.push(e)),i},t.prototype.patch_deepCopy=function(e){for(var n=[],i=0;i<e.length;i++){var r=e[i],h=new t.patch_obj;h.diffs=[];for(var s=0;s<r.diffs.length;s++)h.diffs[s]=r.diffs[s].slice();h.start1=r.start1,h.start2=r.start2,h.length1=r.length1,h.length2=r.length2,n[i]=h}return n},t.prototype.patch_apply=function(t,e){if(0==t.length)return[e,[]];t=this.patch_deepCopy(t);var n=this.patch_addPadding(t);e=n+e+n,this.patch_splitMax(t);for(var i=0,r=[],h=0;h<t.length;h++){var s,f=t[h].start2+i,a=this.diff_text1(t[h].diffs),l=-1;if(a.length>this.Match_MaxBits?(s=this.match_main(e,a.substring(0,this.Match_MaxBits),f),-1!=s&&(l=this.match_main(e,a.substring(a.length-this.Match_MaxBits),f+a.length-this.Match_MaxBits),-1==l||s>=l)&&(s=-1)):s=this.match_main(e,a,f),-1==s)r[h]=!1,i-=t[h].length2-t[h].length1;else if(r[h]=!0,i=s-f,f=-1==l?e.substring(s,s+a.length):e.substring(s,l+this.Match_MaxBits),a==f)e=e.substring(0,s)+this.diff_text2(t[h].diffs)+e.substring(s+a.length);else if(f=this.diff_main(a,f,!1),a.length>this.Match_MaxBits&&this.diff_levenshtein(f)/a.length>this.Patch_DeleteThreshold)r[h]=!1;else{this.diff_cleanupSemanticLossless(f);for(var g,a=0,l=0;l<t[h].diffs.length;l++){var o=t[h].diffs[l];0!==o[0]&&(g=this.diff_xIndex(f,a)),1===o[0]?e=e.substring(0,s+g)+o[1]+e.substring(s+g):-1===o[0]&&(e=e.substring(0,s+g)+e.substring(s+this.diff_xIndex(f,a+o[1].length))),-1!==o[0]&&(a+=o[1].length)}}}return e=e.substring(n.length,e.length-n.length),[e,r]},t.prototype.patch_addPadding=function(t){for(var e=this.Patch_Margin,n="",i=1;e>=i;i++)n+=String.fromCharCode(i);for(i=0;i<t.length;i++)t[i].start1+=e,t[i].start2+=e;var i=t[0],r=i.diffs;if(0==r.length||0!=r[0][0])r.unshift([0,n]),i.start1-=e,i.start2-=e,i.length1+=e,i.length2+=e;else if(e>r[0][1].length){var h=e-r[0][1].length;r[0][1]=n.substring(r[0][1].length)+r[0][1],i.start1-=h,i.start2-=h,i.length1+=h,i.length2+=h}return i=t[t.length-1],r=i.diffs,0==r.length||0!=r[r.length-1][0]?(r.push([0,n]),i.length1+=e,i.length2+=e):e>r[r.length-1][1].length&&(h=e-r[r.length-1][1].length,r[r.length-1][1]+=n.substring(0,h),i.length1+=h,i.length2+=h),n},t.prototype.patch_splitMax=function(e){for(var n=this.Match_MaxBits,i=0;i<e.length;i++)if(!(e[i].length1<=n)){var r=e[i];e.splice(i--,1);for(var h=r.start1,s=r.start2,f="";0!==r.diffs.length;){var a=new t.patch_obj,l=!0;for(a.start1=h-f.length,a.start2=s-f.length,""!==f&&(a.length1=a.length2=f.length,a.diffs.push([0,f]));0!==r.diffs.length&&a.length1<n-this.Patch_Margin;){var f=r.diffs[0][0],g=r.diffs[0][1];1===f?(a.length2+=g.length,s+=g.length,a.diffs.push(r.diffs.shift()),l=!1):-1===f&&1==a.diffs.length&&0==a.diffs[0][0]&&g.length>2*n?(a.length1+=g.length,h+=g.length,l=!1,a.diffs.push([f,g]),r.diffs.shift()):(g=g.substring(0,n-a.length1-this.Patch_Margin),a.length1+=g.length,h+=g.length,0===f?(a.length2+=g.length,s+=g.length):l=!1,a.diffs.push([f,g]),g==r.diffs[0][1]?r.diffs.shift():r.diffs[0][1]=r.diffs[0][1].substring(g.length))}f=this.diff_text2(a.diffs),f=f.substring(f.length-this.Patch_Margin),g=this.diff_text1(r.diffs).substring(0,this.Patch_Margin),""!==g&&(a.length1+=g.length,a.length2+=g.length,0!==a.diffs.length&&0===a.diffs[a.diffs.length-1][0]?a.diffs[a.diffs.length-1][1]+=g:a.diffs.push([0,g])),l||e.splice(++i,0,a)}}},t.prototype.patch_toText=function(t){for(var e=[],n=0;n<t.length;n++)e[n]=t[n];return e.join("")},t.prototype.patch_fromText=function(e){var n=[];if(!e)return n;e=e.split("\n");for(var i=0,r=/^@@ -(\d+),?(\d*) \+(\d+),?(\d*) @@$/;i<e.length;){var h=e[i].match(r);if(!h)throw Error("Invalid patch string: "+e[i]);var s=new t.patch_obj;for(n.push(s),s.start1=parseInt(h[1],10),""===h[2]?(s.start1--,s.length1=1):"0"==h[2]?s.length1=0:(s.start1--,s.length1=parseInt(h[2],10)),s.start2=parseInt(h[3],10),""===h[4]?(s.start2--,s.length2=1):"0"==h[4]?s.length2=0:(s.start2--,s.length2=parseInt(h[4],10)),i++;i<e.length;){h=e[i].charAt(0);try{var f=decodeURI(e[i].substring(1))}catch(a){throw Error("Illegal escape in patch_fromText: "+f)}if("-"==h)s.diffs.push([-1,f]);else if("+"==h)s.diffs.push([1,f]);else if(" "==h)s.diffs.push([0,f]);else{if("@"==h)break;if(""!==h)throw Error('Invalid patch mode "'+h+'" in: '+f)}i++}}return n},t.patch_obj=function(){this.diffs=[],this.start2=this.start1=null,this.length2=this.length1=0},t.patch_obj.prototype.toString=function(){var t,e;t=0===this.length1?this.start1+",0":1==this.length1?this.start1+1:this.start1+1+","+this.length1,e=0===this.length2?this.start2+",0":1==this.length2?this.start2+1:this.start2+1+","+this.length2,t=["@@ -"+t+" +"+e+" @@\n"];var n;for(e=0;e<this.diffs.length;e++){switch(this.diffs[e][0]){case 1:n="+";break;case-1:n="-";break;case 0:n=" "}t[e+1]=n+encodeURI(this.diffs[e][1])+"\n"}return t.join("").replace(/%20/g," ")},this.diff_match_patch=t,this.DIFF_DELETE=-1,this.DIFF_INSERT=1,this.DIFF_EQUAL=0}();