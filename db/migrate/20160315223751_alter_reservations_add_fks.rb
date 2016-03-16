class AlterReservationsAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :reservations , :users , column: :owner_user_id
    add_foreign_key :reservations , :scripts
    add_foreign_key :reservations , :users  , column: :reserve_for
  end
end
