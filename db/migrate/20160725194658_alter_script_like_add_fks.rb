class AlterScriptLikeAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :script_likes, :scripts
    add_foreign_key :script_likes, :users
  end
end
