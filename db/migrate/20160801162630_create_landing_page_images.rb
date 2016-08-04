class CreateLandingPageImages < ActiveRecord::Migration
  def change
    create_table :landing_page_images do |t|
      t.string :name
      t.string :image

      t.timestamps null: false
    end
  end
end
