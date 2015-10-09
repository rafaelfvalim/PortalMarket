class Currency < ActiveRecord::Base
  has_many :checking_account
  has_many :prices
end
