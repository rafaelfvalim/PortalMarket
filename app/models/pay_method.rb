class PayMethod < ActiveRecord::Base
  belongs_to :invoice
end
