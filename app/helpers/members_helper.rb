module MembersHelper

  def full_name
    member = current_user.member
    "#{member.member_name} #{member.member_last_name}"
  end

  def dash_admin_icon(id)
    case id
      when 1 then
        'fa fa-floppy-o fa-5x'
      when 2 then
        'fa fa-files-o fa-5x'
      when 3 then
        'fa fa-database fa-5x'
      when 4 then
        'fa fa-cogs fa-5x'
      when 5 then
        'fa fa-check-square-o fa-5x'
      when 6 then
        'fa fa-exclamation fa-5x'
    end
  end
  def dash_description(status)
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

  def dash_admin_panel_color(id)
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
        'administradores'
      when current_user.is_contributor? then
        'colaboradores'
      when current_user.is_customer? then
        'empresas'
    end
  end

  def get_function
    case
      when current_user.is_god? then
        'Administrador'
      when current_user.is_contributor? then
        'Colaborador'
      when current_user.is_customer? then
        'Cliente'
    end
  end
end
