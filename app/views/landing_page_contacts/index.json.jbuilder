json.array!(@landing_page_contacts) do |landing_page_contact|
  json.extract! landing_page_contact, :id, :name, :phone, :area, :industry_id, :suggestion
  json.url landing_page_contact_url(landing_page_contact, format: :json)
end
