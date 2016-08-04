json.array!(@landing_texts) do |landing_text|
  json.extract! landing_text, :id, :title, :subtitle, :content, :location_name
  json.url landing_text_url(landing_text, format: :json)
end
