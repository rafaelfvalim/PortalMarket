class AlterLandingPageBannerAddColumnBackgroundImage < ActiveRecord::Migration
  def change
    add_column :landing_page_banners, :background_image, :integer, after: :landing_page_image_id
  end
end
