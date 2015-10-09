class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :member_id
      t.integer :script_id
      t.integer :price_id

      t.timestamps null: false
    end
  end
end
