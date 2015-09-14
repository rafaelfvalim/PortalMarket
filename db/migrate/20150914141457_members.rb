class Members < ActiveRecord::Migration
  def change
    create_table(:members) do |t|
      t.datetime :birthday
      t.string :member_name
      t.string :member_last_name
      t.string :bank
      t.string :bank_ag
      t.string :bank_cc
      t.boolean :client, null: true
      t.boolean :contributor, null: true
      t.string :cpf, null: true, default: ""
      t.string :cnpj, null: true, default: ""
      t.timestamps null: false
    end
  end
end
