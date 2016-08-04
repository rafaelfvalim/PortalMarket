json.array!(@landing_page_banners) do |landing_page_banner|
  json.extract! landing_page_banner, :id, :landing_text_id, :landing_page_image_id
  json.url landing_page_banner_url(landing_page_banner, format: :json)
end
