module ApplicationHelper

  def link_to_add(name, id)
    content_tag(:span, "<span>#{name}</span>".html_safe,
                :id => "#{id}",
                :class => "btn btn-info"
    )

  end

  def link_to_remove(name, id)
    content_tag(:div, "<span>#{name}</span>".html_safe,
                :class => "btn btn-info",
                :id => "#{id}")
  end

end
