class AlterScriptAddEndDevelopementDateColumnAndStartDevelopmentDateColumn < ActiveRecord::Migration
  def change
    add_column :scripts , :start_development_date , :date
    add_column :scripts, :end_development_date , :date
  end
end
