json.array!(@landing_page_images) do |landing_page_image|
  json.extract! landing_page_image, :id, :name, :image
  json.url landing_page_image_url(landing_page_image, format: :json)
end
