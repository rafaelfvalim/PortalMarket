class AlterMemberScriptsAlterPerctualToDecimal < ActiveRecord::Migration
  def change
    change_column :member_scripts, :percentual, :decimal, precision: 5, scale: 1
  end
end
