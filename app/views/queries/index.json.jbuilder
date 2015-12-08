json.array!(@queries) do |query|
  json.extract! query, :id, :search_term, :user_id
  json.url query_url(query, format: :json)
end
