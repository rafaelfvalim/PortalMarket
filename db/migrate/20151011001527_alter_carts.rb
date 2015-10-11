class AlterCarts < ActiveRecord::Migration
  def change
    add_column :carts, :full_sale, :boolean,  after: :price_id
  end
end
