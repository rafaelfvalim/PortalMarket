class AlterLicesesAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :licenses , :invoices
  end
end
