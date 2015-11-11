json.array!(@workplaces) do |workplace|
  json.extract! workplace, :id, :system_id, :system_number
  json.url workplace_url(workplace, format: :json)
end
