json.array!(@complexities) do |complexity|
  json.extract! complexity, :id, :description
  json.url complexity_url(complexity, format: :json)
end
