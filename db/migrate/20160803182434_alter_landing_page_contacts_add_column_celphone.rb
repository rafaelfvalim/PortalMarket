class AlterLandingPageContactsAddColumnCelphone < ActiveRecord::Migration
  def change
    add_column :landing_page_contacts, :cellphone , :string, after: :phone
  end
end
