class CheckingAccount < ActiveRecord::Base
  belongs_to :script
  belongs_to :member
  has_one :currency
end
