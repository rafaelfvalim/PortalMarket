class Invoice < ActiveRecord::Base
  has_many :invoice_statuses
  belongs_to :pay_method
  belongs_to :workplace
  belongs_to :user
  belongs_to :script
  accepts_nested_attributes_for :workplace
  accepts_nested_attributes_for :user
end
