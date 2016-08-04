class LandingPageImage < ActiveRecord::Base
  mount_uploader :image, LandingPageImageUploader
  has_many :landing_page_banners

end
