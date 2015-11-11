class CreateWorkplaces < ActiveRecord::Migration
  def change
    create_table :workplaces do |t|
      t.integer :system_id
      t.string :system_number

      t.timestamps null: false
    end
  end
end
