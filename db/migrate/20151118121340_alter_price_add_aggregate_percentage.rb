class AlterPriceAddAggregatePercentage < ActiveRecord::Migration
  def change
    add_column :prices , :aggregate_percentage , :float , null: true, after: :currency_data
  end
end
