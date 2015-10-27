class Invoice < ActiveRecord::Base
  has_many :invoice_statuses
  has_many :scripts
  has_many :users
  has_many :pay_methods

end
