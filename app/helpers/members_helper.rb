module MembersHelper

  def full_name
    member = current_user.member
    "#{member.member_name} #{member.member_last_name}"
  end

  def dash_status_script_icon(id)
    case id
      when Status::GRAVADO then
        'tronik tronik-floppy tronik-3x'
      when Status::VERIFICACAO_DUPLICIDADE then
        'tronik tronik-popup tronik-3x'
      when Status::VERIFICACAO_CONSISTENCIA then
        'tronik tronik-database tronik-3x'
      when Status::VERIFICACAO_COMPLEXIDADE then
        'tronik tronik-puzzle tronik-3x'
      when Status::APROVADO then
        'tronik tronik-thumbs-up tronik-3x'
      when Status::INICIAL then
        'tronik tronik-puzzle-outline tronik-3x'
      when Status::PRE_LANCAMENTO then
        'fa fa-star-o fa-4x'
      when Status::PRE_LANCAMENTO_APROVADO then
        'fa fa-star-o fa-4x'
    end
  end

  def dash_status_script_friendly_description(status)
    case status
      when Status::GRAVADO then
        'Gravado(s) '
      when Status::VERIFICACAO_DUPLICIDADE then
        'Verif. Duplicidade'
      when Status::VERIFICACAO_CONSISTENCIA then
        'Verif. Consistência'
      when Status::VERIFICACAO_COMPLEXIDADE then
        'Verif. Complexidade'
      when Status::APROVADO then
        'Aprovado(s)'
      when Status::INICIAL then
        'Incompleto(s)'
      when Status::PRE_LANCAMENTO then
        'Pré Lançamento'
      when Status::PRE_LANCAMENTO_APROVADO then
        'Pré Lanç. Apr.'
    end

  end

  def dash_status_script_panel_color(id)
    case id
      when Status::GRAVADO then #Gravado
        'red-bg'
      when Status::VERIFICACAO_DUPLICIDADE then
        'yellow-bg'
      when Status::VERIFICACAO_CONSISTENCIA then
        'orange-bg'
      when Status::VERIFICACAO_COMPLEXIDADE then
        'navy-bg'
      when Status::APROVADO then
        'lazur-bg'
      when Status::INICIAL then
        'lazur-bg'
      when Status::PRE_LANCAMENTO then
        'red-bg'
      when Status::PRE_LANCAMENTO_APROVADO then
        'orange-bg'
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
