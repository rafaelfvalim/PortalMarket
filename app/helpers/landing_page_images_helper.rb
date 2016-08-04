module LandingPageImagesHelper

  def get_image(landing_images, name)
    landing_images.find_by_name(name).nil? ? '' : landing_images.find_by_name(name).image_url
  end
end
