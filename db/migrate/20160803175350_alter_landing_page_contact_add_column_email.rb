class AlterLandingPageContactAddColumnEmail < ActiveRecord::Migration
  def change
    add_column :landing_page_contacts, :email , :string, after: :name
    add_foreign_key :landing_page_contacts, :industries
  end
end
