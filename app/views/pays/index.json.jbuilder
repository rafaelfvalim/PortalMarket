json.array!(@pays) do |pay|
  json.extract! pay, :id
  json.url pay_url(pay, format: :json)
end
