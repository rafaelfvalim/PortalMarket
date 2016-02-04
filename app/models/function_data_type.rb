class FunctionDataType < ActiveRecord::Base
  enum function_type: [:internal_logical_file, :external_interface_file]
  enum complexity: [:baixa, :media, :alta]
  belongs_to :user
  belongs_to :script

end
