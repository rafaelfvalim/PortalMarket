class AlterInvoiceAddWorkplaceId < ActiveRecord::Migration
  def change
    add_column :invoices , :workplace_id , :integer , null: false, after: :invoice_status_id
  end
end
