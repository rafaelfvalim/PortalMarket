class Invoice < ActiveRecord::Base
  has_many :invoice_statuses
  belongs_to :pay_method
  belongs_to :workplace
  belongs_to :user
  accepts_nested_attributes_for :workplace
  accepts_nested_attributes_for :user
end
