class ValueChain < ActiveRecord::Base
  belongs_to :process_module
  belongs_to :script
end
