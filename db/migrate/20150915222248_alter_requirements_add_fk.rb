class AlterRequirementsAddFk < ActiveRecord::Migration
  def change
    add_foreign_key :requirements , :scripts
  end
end
