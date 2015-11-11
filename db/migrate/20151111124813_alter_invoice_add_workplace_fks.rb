class AlterInvoiceAddWorkplaceFks < ActiveRecord::Migration
  def change
    add_foreign_key :invoices , :workplaces
  end
end
