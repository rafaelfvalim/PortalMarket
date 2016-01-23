json.array!(@view_publications) do |view_publication|
  json.extract! view_publication, :id, :publication_id, :visited, :user_id
  json.url view_publication_url(view_publication, format: :json)
end
