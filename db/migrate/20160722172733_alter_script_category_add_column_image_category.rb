class AlterScriptCategoryAddColumnImageCategory < ActiveRecord::Migration
  def change
    add_column :script_categories, :image_category , :string
  end
end
