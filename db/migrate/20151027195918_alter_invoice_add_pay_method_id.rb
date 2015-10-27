class AlterInvoiceAddPayMethodId < ActiveRecord::Migration
  def change
    add_column :invoices, :pay_method_id, :integer , null: false
  end
end
