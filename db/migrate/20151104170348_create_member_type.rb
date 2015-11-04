class CreateMemberType < ActiveRecord::Migration
  def change
    create_table :member_types do |t|
      t.string :description
      t.timestamps
    end
  end
end
