class CreateSolutionTypes < ActiveRecord::Migration
  def change
    create_table :solution_types do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
