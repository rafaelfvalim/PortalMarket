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
    @industries = ['Aerospace and Defense', 'Automotive', 'Banking', 'Chemicals', 'Consumer Products', 'Defense and Security', 'Engineering, Construction, and Operations', 'Healthcare', 'High Tech', 'Higher Education and Research', 'Industrial Machinery and Components', 'Insurance', 'Life Sciences', 'Media', 'Mill Products', 'Mining', 'Oil and Gas', 'Professional Services', 'Public Sector', 'Retail', 'Sports and Entertainment', 'Telecommunications', 'Travel and Transportation', 'Utilities', 'Wholesale Distribution']
  end


  def get_complexities
    @complexities ||= Array.new
    @complexities = ['Altamente Complexo AC6M', 'Altamente Complexo AC5M', 'Altamente Complexo AC4M', 'Altamente Complexo AC3M', 'Altamente Complexo AC2M', 'Muito complexo MCMAX', 'Muito complexo MCMIN', '    Complexo MMAX', 'Complexo MMIN', 'Baixo BMAX', 'Baixo BMIN', 'Muito baixo MBMAX', 'Muito baixo MBMIN']
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
        return "Informe para qual finalidade do script de forma objetiva "
      when :long_text
        return "Informe uma descrição longa do script "
      when :requirements
        return "Informe os requerimentos para que esse Script possa ser aplicado no ambiente "
      when :related_scripts
        return "Informe os scripts realcionados digitando e selecionando na lista "
    end
  end


end
