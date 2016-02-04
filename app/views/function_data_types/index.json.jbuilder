json.array!(@function_data_types) do |function_data_type|
  json.extract! function_data_type, :id, :function_type, :user_id, :script_id, :description, :number_of_registers_types, :number_of_data_types, :complexity, :number_of_function_points
  json.url function_data_type_url(function_data_type, format: :json)
end
