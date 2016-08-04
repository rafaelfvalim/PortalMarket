class CreateLandingTexts < ActiveRecord::Migration
  def change
    create_table :landing_texts do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.string :location_name

      t.timestamps null: false
    end
  end
end
