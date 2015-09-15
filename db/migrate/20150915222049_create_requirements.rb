class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.integer :script_id
      t.string :requirement
    end
  end
end
