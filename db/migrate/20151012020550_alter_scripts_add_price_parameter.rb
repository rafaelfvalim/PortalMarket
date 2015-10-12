class AlterScriptsAddPriceParameter < ActiveRecord::Migration
  def change
    add_column :scripts, :has_price, :boolean, after: :complexity
  end
end
