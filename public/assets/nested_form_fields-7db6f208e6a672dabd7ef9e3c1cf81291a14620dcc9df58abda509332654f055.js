(function(){window.nested_form_fields||(window.nested_form_fields={}),nested_form_fields.bind_nested_forms_links=function(){return $("body").off("click",".add_nested_fields_link"),$("body").on("click",".add_nested_fields_link",function(e){var t,d,i,n,s,o,_,l,r,a;return d=$(this),l=d.data("object-class"),o=d.data("association-path"),s=$(".nested_"+o).length,$.event.trigger("fields_adding.nested_form_fields",{object_class:l,added_index:s,association_path:o}),n=$("#"+o+"_template"),r=d.attr("data-insert-into"),a=n.html(),_="__"+o+"_index__",a=a.replace(new RegExp(_,"g"),s),i=$(a),t=i.closestChild(".form_template"),t.each(function(){var e;return e=$(this),e.replaceWith($("<script id='"+e.attr("id")+"' type='text/html' />").html(e.html()))}),null!=r?$("#"+r).append(i):n.before(i),i.trigger("fields_added.nested_form_fields",{object_class:l,added_index:s,association_path:o,event:e}),!1}),$("body").off("click",".remove_nested_fields_link"),$("body").on("click",".remove_nested_fields_link",function(){var e,t,d,i,n;return e=$(this),$.rails.allowAction(e)?(i=e.data("object-class"),d=e.data("delete-association-field-name"),n=parseInt(d.match("(\\d+\\]\\[_destroy])")[0][0]),$.event.trigger("fields_removing.nested_form_fields",{object_class:i,delete_association_field_name:d,removed_index:n}),t=e.parents(".nested_fields").first(),t.before("<input type='hidden' name='"+d+"' value='1' />"),t.hide(),t.find("input[required]:hidden").removeAttr("required"),t.trigger("fields_removed.nested_form_fields",{object_class:i,delete_association_field_name:d,removed_index:n}),!1):!1})},$(document).on("page:change",function(){return nested_form_fields.bind_nested_forms_links()}),jQuery(function(){return nested_form_fields.bind_nested_forms_links()}),$.fn.closestChild=function(e){var t,d;return t=void 0,d=void 0,t=this.children(),0===t.length?$():(d=t.filter(e),d.length>0?d:t.closestChild(e))}}).call(this);