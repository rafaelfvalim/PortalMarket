class AlterCartsAddWorkplaceId < ActiveRecord::Migration
  def change
    add_column :carts , :workplace_id , :integer , null: false, after: :price_id
  end
end
