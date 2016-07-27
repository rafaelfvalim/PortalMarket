json.array!(@script_categories) do |script_category|
  json.extract! script_category, :id, :category_id, :script_id
  json.url script_category_url(script_category, format: :json)
end
