class AlterLandingPageBannersAddColumnName < ActiveRecord::Migration
  def change
    add_column :landing_page_banners, :name, :string, after: :id
  end
end
