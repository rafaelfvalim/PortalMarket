class AlterCartsAddWorkplaceFks < ActiveRecord::Migration
  def change
    add_foreign_key :carts , :workplaces
  end
end
