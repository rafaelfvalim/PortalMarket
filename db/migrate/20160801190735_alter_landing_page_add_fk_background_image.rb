class AlterLandingPageAddFkBackgroundImage < ActiveRecord::Migration
  def change
    add_foreign_key :landing_page_banners, :landing_page_images, column: :background_image
  end
end
