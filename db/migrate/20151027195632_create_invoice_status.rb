class CreateInvoiceStatus < ActiveRecord::Migration
  def change
    create_table :invoice_statuses do |t|
      t.string :description
      t.timestamps
    end
  end
end
