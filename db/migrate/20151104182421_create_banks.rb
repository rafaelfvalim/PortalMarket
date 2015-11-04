class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.integer  :code , null: false
      t.string   :description, null: false
      t.timestamps null: false
    end
  end
end
