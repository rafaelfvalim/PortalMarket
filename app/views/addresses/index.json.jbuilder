json.array!(@addresses) do |address|
  json.extract! address, :id, :zip_code, :patio_type, :patio, :city, :street, :state, :neighborhood, :complement, :number
  json.url address_url(address, format: :json)
end
