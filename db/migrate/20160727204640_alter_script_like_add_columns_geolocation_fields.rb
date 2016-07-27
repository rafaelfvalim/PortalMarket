class AlterScriptLikeAddColumnsGeolocationFields < ActiveRecord::Migration
  def change
    add_column :script_likes, :city , :string
    add_column :script_likes, :country , :string
    add_column :script_likes, :countryCode , :string
    add_column :script_likes, :regionName , :string
    add_column :script_likes, :region , :string
  end
end
