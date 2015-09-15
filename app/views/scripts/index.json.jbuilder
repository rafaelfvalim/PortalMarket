json.array!(@scripts) do |script|
  json.extract! script, :id, :description, :definition, :long_text, :platform, :industry, :solution_type_id, :script_file, :pdf_file, :complexity
  json.url script_url(script, format: :json)
end
