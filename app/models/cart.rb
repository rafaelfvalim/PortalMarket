class Cart < ActiveRecord::Base
  acts_as_shopping_cart_using :script
  belongs_to :member
  belongs_to :script
  belongs_to :price
end
