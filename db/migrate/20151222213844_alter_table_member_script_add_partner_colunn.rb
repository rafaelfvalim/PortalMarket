class AlterTableMemberScriptAddPartnerColunn < ActiveRecord::Migration
  def change
    add_column :member_scripts , :partner , :boolean , after: :percentual
  end
end
