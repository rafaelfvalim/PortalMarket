class Category < ActiveRecord::Base
  has_many :script_category, dependent: :destroy
  mount_uploader :image_dummy, ImageDummyUploader
end
