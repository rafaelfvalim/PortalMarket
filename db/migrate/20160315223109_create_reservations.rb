class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :script_id
      t.integer :owner_user_id
      t.integer :reserve_for
      t.datetime :expiration_time

      t.timestamps null: false
    end
  end
end
