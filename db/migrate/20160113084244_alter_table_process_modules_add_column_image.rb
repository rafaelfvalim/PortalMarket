class AlterTableProcessModulesAddColumnImage < ActiveRecord::Migration
  def change
    add_column :process_modules , :image , :string
  end
end
