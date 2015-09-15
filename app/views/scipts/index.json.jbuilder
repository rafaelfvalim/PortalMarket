json.array!(@scipts) do |scipt|
  json.extract! scipt, :id, :description, :definition, :plataform, :industry, :solution_id, :script_file, :pdf_file, :complexity
  json.url scipt_url(scipt, format: :json)
end
