class AlterFunctionDataTypesAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :function_data_types , :users
    add_foreign_key :function_data_types , :scripts
  end
end
