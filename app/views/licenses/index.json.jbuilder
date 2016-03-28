json.array!(@licenses) do |license|
  json.extract! license, :id, :invoice_id, :description, :key, :expiration_date, :valid, :obs
  json.url license_url(license, format: :json)
end
