json.array!(@related_scripts) do |related_script|
  json.extract! related_script, :id, :related_script
  json.url related_script_url(related_script, format: :json)
end
