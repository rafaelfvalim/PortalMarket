module ApplicationHelper

  def link_to_add(name, id)
    content_tag(:span, "<span>#{name}</span>".html_safe,
                :id => "#{id}")

  end

  def link_to_remove(name)
    content_tag(:div, "<span>Remove</span>".html_safe,
                :class => "remove_child")
  end

end
