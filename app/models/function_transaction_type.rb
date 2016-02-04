class FunctionTransactionType < ActiveRecord::Base
  enum function_type: [:external_input, :external_out_put, :extern_consult]
  enum complexity: [:baixa, :media, :alta]
  belongs_to :user
  belongs_to :script
end
