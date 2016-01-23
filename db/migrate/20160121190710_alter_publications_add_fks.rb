class AlterPublicationsAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :publications , :file_tags
    add_foreign_key :publications , :folders
    add_foreign_key :publications , :users
  end
end
