module RequirementsHelper

  def link_to_add(name, id)
    content_tag(:spam, "<span>#{name}</span>".html_safe,
                :id => "#{id}")
  end

  def link_to_remove(name)
    content_tag(:div, "<span>Remove</span>".html_safe,
                :class => "remove_child")
  end

  def new_fields_template(f, association, options={})
    options[:object] ||= f.object.class.reflect_on_association(association).klass.new
    options[:partial] ||= association.to_s.singularize+"_fields"
    options[:template] ||= association.to_s+"_fields"
    options[:f] ||= :f

    tmpl = content_tag(:div, :id => "#{options[:template]}") do
      tmpl = f.fields_for(association, options[:object], :child_index => "new_#{association}") do |b|
        render(:partial => options[:partial], :locals => {:f => b})
      end
    end
    tmpl = tmpl.gsub /(?<!\n)\n(?!\n)/, ' '
    return "<script> var #{options[:template]} = '#{tmpl.to_s}' </script>".html_safe
  end

end
