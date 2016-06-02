module MembersHelper

  def full_name
    member = current_user.member
    "#{member.member_name} #{member.member_last_name}"
  end

  def dash_status_script_icon(id)
    case id
      when 1 then
        #Gravado
        'tronik tronik-floppy tronik-3x'
      when 2 then
        # Verificação de Duplicidade
        'tronik tronik-popup tronik-3x'
      when 3 then
        # Verificação de Consistência
        'tronik tronik-database tronik-3x'
      when 4 then
        # Verficação de Complexidade
        'tronik tronik-puzzle tronik-3x'
      when 5 then
        # Aprovado
        'tronik tronik-thumbs-up tronik-3x'
      when 6 then
        # Inicial
        'tronik tronik-puzzle-outline tronik-3x'
    end
  end

  def dash_status_script_friendly_description(status)
    case status
      when 'Gravado' then
        'Gravado(s) '
      when 'Verificação de Duplicidade' then
        'Verif. Duplicidade'
      when 'Verificação de Consistência' then
        'Verif. Consistência'
      when 'Verficação de Complexidade' then
        'Verif. Complexidade'
      when 'Aprovado' then
        'Aprovado(s)'
      when 'Sem preço' then
        'Sem preço'
      when 'Inicial' then
        'Incompleto(s)'
    end

  end

  def dash_status_script_panel_color(id)
    case id
      when 1 then #Gravado
        'red-bg'
      when 2 then #Verificação de Duplicidade
        'yellow-bg'
      when 3 then #Verificação de Consistência
        'orange-bg'
      when 4 then #Verficação de Complexidade
        'navy-bg'
      when 5 then #Aprovado
        'lazur-bg'
      when 6 then #Gravado
        'red-bg'
    end
  end

  def linK_status_disable(count)
    return if count == 0 ? true : false
  end

  def member_type_description
    case
      when current_user.is_god? then
        'administrador'
      when current_user.is_contributor? then
        'parceiro'
      when current_user.is_customer? then
        'cliente'
      when current_user.is_customer_contributor? then
        'cliente parceiro'
    end
  end

  def get_function
    case
      when current_user.is_god? then
        'Administrador'
      when current_user.is_contributor? then
        'Parceiro'
      when current_user.is_customer? then
        'Cliente'
      when current_user.is_customer_contributor? then
        'Cliente/Parceiro'
    end
  end


  def cpf_cnpj(member)
    member.cnpj.present? ? "<b> CNPJ: </b> #{member.cnpj}".html_safe : "<b>CPF: </b> #{member.cpf}".html_safe
  end
end
