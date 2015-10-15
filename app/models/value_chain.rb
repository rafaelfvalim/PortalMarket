class ValueChain < ActiveRecord::Base
  belongs_to :process_module
  belongs_to :script

  def self.save_all
    ValueChain.all.each { |value_chain| value_chain.save! }
  end
end
