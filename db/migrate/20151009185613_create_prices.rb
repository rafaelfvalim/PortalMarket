class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :script_id
      t.decimal :value
      t.integer :currency_id
      t.date :currency_data

      t.timestamps null: false
    end
  end
end
