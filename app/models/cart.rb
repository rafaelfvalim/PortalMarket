class Cart < ActiveRecord::Base
  belongs_to :member
  belongs_to :script
  belongs_to :price
end
