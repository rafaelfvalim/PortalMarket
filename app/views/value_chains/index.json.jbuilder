json.array!(@value_chains) do |value_chain|
  json.extract! value_chain, :id, :process_module_id, :script_id
  json.url value_chain_url(value_chain, format: :json)
end
