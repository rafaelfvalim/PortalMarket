class CreateCheckingAccount < ActiveRecord::Migration
  def change
    create_table :checking_accounts do |t|
      t.string :description
      t.datetime :payment_date_time
      t.datetime :movement_date_time
      t.string :status
      t.decimal :value
      t.float :interest
      t.integer :member_id
      t.decimal :commission
      t.integer :currency_id
      t.date :currency_base_date
      t.integer :script_id
      t.string :code_type

      t.timestamps null: false
    end
  end
end
