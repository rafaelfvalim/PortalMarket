module ScriptsHelper

  def generate_statsus_li(status, script)
    if script.status_id.nil?
      content_tag(:li, status.description)
    else
      case
        when status.id < script.status_id
          content_tag(:li, status.description)
        when status.id == script.status_id
          content_tag(:li, status.description,
                      class: "active")
        when status.id > script.status_id
          content_tag(:li, status.description)
      end
    end
  end

  def get_platforms
    @platform_array ||= Array.new
    @platform_array = ['SAP', 'Oracle', 'TOTVS', 'Java', 'PHP']
  end

  def get_industries
    @industries ||= Array.new
    @industries = Industry.all.map(&:description)
  end

  def get_complexities
    @complexities = Complexity.all.map(&:description)
  end

  def set_info_script_messages(field)
    # para facilitar a internacionalização
    case field
      when :name
        return "Nome do Script"
      when :description
        return "Descrição do Script"
      when :platform
        return "Plataforma para qual o Script será desenvovido"
      when :industry
        return "Selecione a industria que Script esta relacionado"
      when :solution_type_id
        return "Selecione o tipo da Solução"
      when :complexity
        return "Selecione a complexidade do script "
      when :definition
        return "Informe de forma objetiva qual a finalidade do script "
      when :long_text
        return "Informe uma descrição longa do script "
      when :requirements
        return "Informe os requerimentos para que esse Script possa ser aplicado no ambiente "
      when :related_scripts
        return "Informe os scripts realcionados digitando e selecionando na lista "
    end
  end

  def get_action_for_script(status_id, script)
    case status_id
      when 1 then
        link_to "Show", script_path(script.id), class: 'btn btn-info'
      when 2 then
        link_to "Show", script_path(script.id), class: 'btn btn-info'
      when 3 then
        link_to "Show", script_path(script.id), class: 'btn btn-info'
      when 4 then
        link_to "Check Complexity", check_complexity_scripts_path(script_id: script.id), class: 'btn btn-info'
      when 5 then
        link_to "Show", script_path(script.id), class: 'btn btn-info'
    end

  end

  def get_all_my_scripts(member_id, status_id)
    return Script.joins(:member_scripts, :status).where('member_scripts.member_id = ? and status_id = ?', member_id, status_id)
  end


end
