json.array!(@publications) do |publication|
  json.extract! publication, :id, :file_name, :file_type, :owner, :folder
  json.url publication_url(publication, format: :json)
end
