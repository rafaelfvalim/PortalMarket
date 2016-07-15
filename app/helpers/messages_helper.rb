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
        <small class='text-muted'>#{format_date_time(message.created_at) }</small>
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


  def get_portal_alerts
    @script_gravados = Script.where(status_id: Status::GRAVADO).count
    @script_verificacao_duplicidade = Script.where(status_id: Status::VERIFICACAO_DUPLICIDADE).count
    @script_verificacao_consistencia = Script.where(status_id: Status::VERIFICACAO_CONSISTENCIA).count
    @script_verificacao_complexidade = Script.where(status_id: Status::VERIFICACAO_COMPLEXIDADE).count
    @script_inicial = Script.where(status_id: Status::INICIAL).count
    @script_prelancamento = Script.where(status_id: Status::PRE_LANCAMENTO).count
    @statuses = [Status::GRAVADO, Status::VERIFICACAO_DUPLICIDADE, Status::VERIFICACAO_CONSISTENCIA, Status::VERIFICACAO_COMPLEXIDADE, Status::INICIAL, Status::PRE_LANCAMENTO]
    @scripts_sem_preco = Script.where(has_price: [nil, false]).count
    @users_intaive = User.inativo.count
    @users_unconfirmed = User.where(confirmed_at: nil).count

    @alerts_total = Script.where(status_id: @statuses).group_by(&:status_id).count
    @alerts_total += @scripts_sem_preco > 0 ? 1 : 0
    @alerts_total += @users_intaive > 0 ? 1 : 0
    @alerts_total += @users_unconfirmed > 0 ? 1 : 0

    html = ''
    html << <<-HTML
    <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
      <i class="fa fa-bell"></i>  <span class="label label-primary">#{@alerts_total}</span>
    </a>
    <ul class="dropdown-menu dropdown-alerts">
    HTML
    if @script_gravados > 0
      html << li_alerts_html_generator(script_orchestration_scripts_path(status_id: Status::GRAVADO), "#{@script_gravados} Gravados")
    end
    if @script_verificacao_duplicidade > 0
      html << li_alerts_html_generator(script_orchestration_scripts_path(status_id: Status::VERIFICACAO_DUPLICIDADE), " #{@script_verificacao_duplicidade} Verificação de Duplicidade")
    end
    if @script_verificacao_consistencia > 0
      html << li_alerts_html_generator(script_orchestration_scripts_path(status_id: Status::VERIFICACAO_CONSISTENCIA), " #{@script_verificacao_consistencia} Verificação de Consistencia")
    end
    if @script_verificacao_complexidade > 0
      html << li_alerts_html_generator(script_orchestration_scripts_path(status_id: Status::VERIFICACAO_COMPLEXIDADE), " #{@script_verificacao_complexidade} Verificação de Complexidade")
    end
    if @script_inicial > 0
      html << li_alerts_html_generator(script_orchestration_scripts_path(status_id: Status::INICIAL), "#{@script_inicial} verificação Status Inicial")
    end
    if @script_prelancamento > 0
      html << li_alerts_html_generator(script_orchestration_scripts_path(status_id: Status::PRE_LANCAMENTO), "#{@script_prelancamento}  Verificação em Pre Lançamento")
    end
    if @scripts_sem_preco > 0
      html << li_alerts_html_generator(script_prices_prices_path, "#{@scripts_sem_preco} Sem Preço")
    end
    if @users_intaive > 0
      html << li_alerts_html_generator(users_path(status: 'inativo'), "#{@users_intaive} Usuário(s) inativos")
    end
    if @users_unconfirmed > 0
      html << li_alerts_html_generator(users_path(unconfirmed: true), "#{@users_unconfirmed} Usuário(s) Ñ confirmados")
    end
    html << <<-HTML
        <li>
           <div class="text-center link-block">
             <a href=#{members_path}>
             <strong>Veja todos os alertas</strong>
             </a>
           </div>
        </li>
    </ul>
    HTML
    html.html_safe
  end

  def li_alerts_html_generator(path, counter_message)
    html = ''
    html << <<-HTML
     <li>
      <a href=#{path}>
        <div>
          #{counter_message}
        </div>
      </a>
    </li>
    <li class="divider"></li>
    HTML
  end

end
