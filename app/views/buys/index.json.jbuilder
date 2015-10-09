json.array!(@buys) do |buy|
  json.extract! buy, :id
  json.url buy_url(buy, format: :json)
end
