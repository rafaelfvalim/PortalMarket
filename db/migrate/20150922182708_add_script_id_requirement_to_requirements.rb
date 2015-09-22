class AddScriptIdRequirementToRequirements < ActiveRecord::Migration
  def change
    add_column :requirements, :script_id_requirement, :integer, null: true
  end
end
