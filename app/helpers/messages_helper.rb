module MessagesHelper


  def broadcast(channel, &block)
    message = {channel: channel, data: capture(&block)}
    uri = URI.parse("http://10.11.50.108:9292/faye")
    Net::HTTP.post_form(uri, message: message.to_json)
  end

  def chat(message)
    user = User.find(message.user_id);

      class_element = 'chat-element left'
      class_element_link = 'pull-left'
      class_media_body = 'media-body text-left '
      class_media_body_small = 'pull-right text-navy'

    html = <<-HTML
      <div class= "#{class_element}">
        <a href='#' class= "#{class_element_link}">#{get_cicle_avatar(user)}</a>
        <div class= "#{class_media_body}">
        <small class= "#{class_media_body_small}">#{time_ago_in_words(message.created_at)}</small>
          <strong>#{user.full_name}</strong>
        <p class='m-b-xs'>#{message.content }</p>
        <small class='text-muted'>#{format_date(message.created_at) }</small>
        </div>
      </div>
    HTML
    html.html_safe
  end

  def message_chat_filter(message)
    white_list_sanitizer = Rails::Html::WhiteListSanitizer.new
    html_white_list = %w(p b h1 h2 h3 h4 h5 h6 li ul ol small i u)
    if message.length > 85
      white_list_sanitizer.sanitize(message, tags: html_white_list).scan(/.{1,80}/).join(" ").gsub(/[\r\n]+/, "<br>").html_safe
    else
      white_list_sanitizer.sanitize(message, tags: html_white_list).gsub(/[\r\n]+/, "<br>").html_safe
    end
  end

end
