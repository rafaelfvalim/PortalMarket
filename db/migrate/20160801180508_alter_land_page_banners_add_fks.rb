class AlterLandPageBannersAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :landing_page_banners, :landing_page_images
    add_foreign_key :landing_page_banners, :landing_texts
  end
end
