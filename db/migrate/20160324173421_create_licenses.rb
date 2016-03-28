class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.integer :invoice_id
      t.string :description
      t.string :key
      t.datetime :expiration_date
      t.boolean :valid
      t.text :obs

      t.timestamps null: false
    end
  end
end
