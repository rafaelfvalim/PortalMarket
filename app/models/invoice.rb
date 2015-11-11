class Invoice < ActiveRecord::Base
  has_many :invoice_statuses
  has_many :scripts
  has_many :users
  has_many :pay_methods
  has_one :workplace
  accepts_nested_attributes_for :workplace
end
