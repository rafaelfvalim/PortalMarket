class AlterMembersAddTelCel < ActiveRecord::Migration
  def change
    add_column :members , :phone_number , :string , null: true , after: :member_last_name
    add_column :members , :cellphone_number , :string , null: true , after: :phone_number
  end
end
