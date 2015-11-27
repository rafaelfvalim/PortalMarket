class AlterInvoiceAddColumnScriptFile < ActiveRecord::Migration
  def change
    add_column :invoices , :script_file , :string , after: :workplace_id
  end
end
