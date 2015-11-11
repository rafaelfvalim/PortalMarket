class AlterWorkplaceAddFks < ActiveRecord::Migration
  def change
    add_foreign_key :workplaces , :systems
  end
end
