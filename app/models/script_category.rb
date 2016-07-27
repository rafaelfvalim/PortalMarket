class ScriptCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :script
  mount_uploader :image_category, ImageCategoryUploader
end
