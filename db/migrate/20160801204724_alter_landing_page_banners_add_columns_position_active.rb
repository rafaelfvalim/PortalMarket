class AlterLandingPageBannersAddColumnsPositionActive < ActiveRecord::Migration
  def change
    add_column :landing_page_banners , :position, :integer
    add_column :landing_page_banners , :item_list, :string
  end
end
