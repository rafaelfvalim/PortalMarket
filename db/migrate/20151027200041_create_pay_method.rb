class CreatePayMethod < ActiveRecord::Migration
  def change
    create_table :pay_methods do |t|
      t.string :name
      t.string :notes
      t.timestamps
    end
  end
end
