class AlterBankChangeColumnCodeTypeIntToString < ActiveRecord::Migration
  def change
    change_column :banks, :code, :string
  end
end
