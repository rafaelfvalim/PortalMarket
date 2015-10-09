class Price < ActiveRecord::Base
  belongs_to :script
  belongs_to :currency
end
