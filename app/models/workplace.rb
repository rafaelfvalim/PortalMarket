class Workplace < ActiveRecord::Base
  belongs_to :member
  belongs_to :system
  belongs_to :invoice
  has_many :carts
end
