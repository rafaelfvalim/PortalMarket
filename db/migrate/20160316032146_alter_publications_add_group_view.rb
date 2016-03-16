class AlterPublicationsAddGroupView < ActiveRecord::Migration
  def change
    add_column :publications , :view_group , :string , null: true
  end
end
