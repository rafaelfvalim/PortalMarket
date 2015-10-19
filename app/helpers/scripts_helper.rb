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
    @industries =  ['Aerospace and Defense', 'Automotive', 'Banking', 'Chemicals', 'Consumer Products', 'Defense and Security', 'Engineering, Construction, and Operations', 'Healthcare', 'High Tech', 'Higher Education and Research', 'Industrial Machinery and Components', 'Insurance', 'Life Sciences', 'Media', 'Mill Products', 'Mining', 'Oil and Gas', 'Professional Services', 'Public Sector', 'Retail', 'Sports and Entertainment', 'Telecommunications', 'Travel and Transportation', 'Utilities', 'Wholesale Distribution']
  end


  def get_complexities
    @complexities ||= Array.new
    @complexities =  ['Altamente Complexo AC6M', 'Altamente Complexo AC5M', 'Altamente Complexo AC4M', 'Altamente Complexo AC3M', 'Altamente Complexo AC2M', 'Muito complexo MCMAX', 'Muito complexo MCMIN', '    Complexo MMAX', 'Complexo MMIN', 'Baixo BMAX', 'Baixo BMIN', 'Muito baixo MBMAX', 'Muito baixo MBMIN']
  end

end
