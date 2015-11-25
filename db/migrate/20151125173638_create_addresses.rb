class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :zip_code
      t.string :patio_type
      t.string :patio
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :city
      t.string :state
      t.string :complement

      t.timestamps null: false
    end
  end
end
