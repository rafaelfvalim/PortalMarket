json.array!(@script_likes) do |script_like|
  json.extract! script_like, :id, :script_id, :user_id
  json.url script_like_url(script_like, format: :json)
end
