class AlterUserAddColumnKeyPhrase < ActiveRecord::Migration
  def change
    add_column :users , :key_phrase , :string , null: true
  end
end
