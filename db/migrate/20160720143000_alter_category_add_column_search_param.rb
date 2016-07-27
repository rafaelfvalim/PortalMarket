class AlterCategoryAddColumnSearchParam < ActiveRecord::Migration
  def change
    add_column :categories, :search_param , :string , after: :description
  end
end
