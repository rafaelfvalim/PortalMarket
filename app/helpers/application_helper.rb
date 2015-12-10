module ApplicationHelper

  def is_active_controller(controller_name)
    params[:controller] == controller_name ? "active" : nil
  end

  def is_active_action(action_name)
    params[:action] == action_name ? "active" : nil
  end


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

  def errors_for(object)
    if object.errors.any?
      content_tag(:div, class: "panel panel-danger") do
        concat(content_tag(:div, class: "panel-heading") do
                 concat(content_tag(:h4, class: "panel-title") do
                          concat "#{pluralize(object.errors.count, "error")} prohibited this #{object.class.name.downcase} from being saved:"
                        end)
               end)
        concat(content_tag(:div, class: "panel-body") do
                 concat(content_tag(:ul) do
                          object.errors.full_messages.each do |msg|
                            concat content_tag(:li, msg)
                          end
                        end)
               end)
      end
    end
  end

  def devise_error_messages_custom!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="col-lg-6 col-centered"  id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

end
