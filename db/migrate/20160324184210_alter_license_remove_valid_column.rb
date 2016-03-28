class AlterLicenseRemoveValidColumn < ActiveRecord::Migration
  def change
    remove_column :licenses, :valid
  end
end
