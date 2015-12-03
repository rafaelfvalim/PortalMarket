class AlterUsersAddColumnUserStatus < ActiveRecord::Migration
  def change
    add_column :users , :status , :string , default: 'inativo' , after: :address_id
  end
end
