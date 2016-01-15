class AlterProcessModuleAddColumnLongDescription < ActiveRecord::Migration
  def change
    add_column :process_modules , :long_description , :string
  end
end
