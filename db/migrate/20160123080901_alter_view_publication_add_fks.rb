class AlterViewPublicationAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :view_publications , :users
    add_foreign_key :view_publications , :publications
  end
end
