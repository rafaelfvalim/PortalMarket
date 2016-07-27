class AlterScriptCategoryAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :script_categories, :scripts
    add_foreign_key :script_categories, :categories
  end
end
