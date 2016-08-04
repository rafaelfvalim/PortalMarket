class CreateLandingPageContacts < ActiveRecord::Migration
  def change
    create_table :landing_page_contacts do |t|
      t.string :name
      t.string :phone
      t.string :area
      t.integer :industry_id
      t.text :suggestion

      t.timestamps null: false
    end
  end
end
