class AlterScriptsAddSolutionTypeFk < ActiveRecord::Migration
  def change
    add_foreign_key :scripts , :solution_types
  end
end
