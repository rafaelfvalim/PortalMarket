class AlterSearchjoySearchesAddUserFk < ActiveRecord::Migration
  def change
    add_foreign_key :searchjoy_searches , :users , null: true
  end
end
