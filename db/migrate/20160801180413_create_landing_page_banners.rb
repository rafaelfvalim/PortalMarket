class CreateLandingPageBanners < ActiveRecord::Migration
  def change
    create_table :landing_page_banners do |t|
      t.integer :landing_text_id
      t.integer :landing_page_image_id
      t.timestamps null: false
    end
  end
end
