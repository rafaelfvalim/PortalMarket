class AlterMemberAddCompanyName < ActiveRecord::Migration
  def change
    add_column :members , :company_name , :string , after: :cnpj
  end
end
