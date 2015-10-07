class AlterScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :name, :string, after: :id
  end
end
