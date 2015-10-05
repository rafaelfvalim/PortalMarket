class AlterScriptsAddColumnStatusId < ActiveRecord::Migration
  def change
    add_column :scripts, :status_id, :integer, null: true
  end
end
