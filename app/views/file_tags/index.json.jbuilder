json.array!(@file_tags) do |file_tag|
  json.extract! file_tag, :id, :name
  json.url file_tag_url(file_tag, format: :json)
end
