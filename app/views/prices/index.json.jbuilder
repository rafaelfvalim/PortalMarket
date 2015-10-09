json.array!(@prices) do |price|
  json.extract! price, :id, :script_id, :value, :currency_id, :currency_data
  json.url price_url(price, format: :json)
end
