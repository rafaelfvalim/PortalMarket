module LandingTextsHelper

  def get_title(landing_texts, location_name)
    landing_texts.find_by_location_name(location_name).title.html_safe
  end

  def get_subtitle(landing_texts, location_name)
    landing_texts.find_by_location_name(location_name).subtitle.html_safe
  end

  def get_content(landing_texts, location_name)
    landing_texts.find_by_location_name(location_name).content.html_safe
  end


end
