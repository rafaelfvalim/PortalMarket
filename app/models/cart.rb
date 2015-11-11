class Cart < ActiveRecord::Base
  belongs_to :member
  belongs_to :script
  belongs_to :price
  belongs_to :workplace , dependent: :destroy, autosave: true
  accepts_nested_attributes_for :workplace

end
