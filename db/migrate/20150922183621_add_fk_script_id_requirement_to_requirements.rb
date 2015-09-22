class AddFkScriptIdRequirementToRequirements < ActiveRecord::Migration
  def change
    add_foreign_key :requirements , :scripts , column: :script_id_requirement, null: true
  end
end
