json.array!(@member_scripts) do |member_script|
  json.extract! member_script, :id, :member_id, :script_id, :participation, :percentual
  json.url member_script_url(member_script, format: :json)
end
