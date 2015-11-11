class AlterWorkplacesAddOrganizationName < ActiveRecord::Migration
  def change
    add_column :workplaces , :organization_name , :string , after: :member_id
  end
end
