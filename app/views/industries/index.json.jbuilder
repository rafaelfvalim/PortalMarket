json.array!(@industries) do |industry|
  json.extract! industry, :id, :description
  json.url industry_url(industry, format: :json)
end
