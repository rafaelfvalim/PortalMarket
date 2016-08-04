class LandingPageBanner < ActiveRecord::Base
  belongs_to :landing_page_image
  belongs_to :landing_text


  def image_url
    if self.landing_page_image_id.present?
      LandingPageImage.find(self.landing_page_image_id).image_url
    end
  end

  def background_image_url
    if self.background_image.present?
      LandingPageImage.find(self.background_image).image_url
    end
  end

  def title
    self.landing_text.title.html_safe
  end

  def subtitle
    self.landing_text.subtitle.html_safe
  end

  def content
    self.landing_text.content.html_safe
  end

  def get_item_list
    if self.position == 1
      'active'
    end
  end

end
