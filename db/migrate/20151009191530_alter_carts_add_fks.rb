class AlterCartsAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :carts , :scripts
    add_foreign_key :carts , :members
    add_foreign_key :carts , :prices
  end
end
