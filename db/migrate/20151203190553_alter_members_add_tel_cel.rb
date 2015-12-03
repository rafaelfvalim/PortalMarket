class AlterMembersAddTelCel < ActiveRecord::Migration
  def change
    add_column :members , :telephone , :string , null: true , after: :member_last_name
    add_column :members , :cellphone , :string , null: true , after: :telephone
  end
end
