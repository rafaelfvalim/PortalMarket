class CreateValueChains < ActiveRecord::Migration
  def change
    create_table :value_chains do |t|
      t.references :process_module, index_teaser: true, foreign_key: true
      t.references :script, index_teaser: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
