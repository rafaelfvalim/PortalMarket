json.array!(@function_transaction_types) do |function_transaction_type|
  json.extract! function_transaction_type, :id, :user_id, :script_id, :function_type, :description, :number_of_referenced_files, :number_of_data_types, :complexity, :number_of_function_points
  json.url function_transaction_type_url(function_transaction_type, format: :json)
end
