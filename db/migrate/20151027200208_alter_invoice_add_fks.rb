class AlterInvoiceAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :invoices , :scripts
    add_foreign_key :invoices , :pay_methods
    add_foreign_key :invoices , :users
    add_foreign_key :invoices , :invoice_statuses
  end
end
