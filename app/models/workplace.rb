class Workplace < ActiveRecord::Base
  belongs_to :member
  belongs_to :system
  has_many :invoice
  has_many :carts
end
