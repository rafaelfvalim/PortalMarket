class CreateInvoice < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :user_id
      t.integer :script_id
      t.decimal :value
      t.integer :invoice_status_id
      t.text :notes
      t.datetime :invoice_date
      t.datetime :pay_date
      t.datetime :ship_date
      t.string :shipped_to
      t.string :shipped_via
      t.timestamps
    end
  end
end
