class AlterCategoriesAddColumnImageDummy < ActiveRecord::Migration
  def change
    add_column :categories, :image_dummy , :string
  end
end
