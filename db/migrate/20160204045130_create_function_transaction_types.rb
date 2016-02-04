class CreateFunctionTransactionTypes < ActiveRecord::Migration
  def change
    create_table :function_transaction_types do |t|
      t.string :function_type
      t.integer :user_id
      t.integer :script_id
      t.string :description
      t.integer :number_of_referenced_files
      t.integer :number_of_data_types
      t.string :complexity
      t.integer :number_of_function_points

      t.timestamps null: false
    end
  end
end
