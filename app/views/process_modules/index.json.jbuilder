json.array!(@process_modules) do |process_module|
  json.extract! process_module, :id, :description, :self_process_module_id
  json.url process_module_url(process_module, format: :json)
end
