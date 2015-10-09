class AlterPriceAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :prices , :scripts
    add_foreign_key :prices , :currencies
  end
end
