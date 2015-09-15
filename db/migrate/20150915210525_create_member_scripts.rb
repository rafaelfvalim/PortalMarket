class CreateMemberScripts < ActiveRecord::Migration
  def change
    create_table :member_scripts do |t|
      t.integer :member_id
      t.integer :script_id
      t.float :participation
      t.float :percentual

      t.timestamps null: false
    end
  end
end
