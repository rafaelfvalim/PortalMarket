class AlterLicenseColumnKey < ActiveRecord::Migration
  def change
    rename_column :licenses, :key, :license_key
  end
end
