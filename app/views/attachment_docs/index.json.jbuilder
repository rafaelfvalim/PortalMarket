json.array!(@attachment_docs) do |attachment_doc|
  json.extract! attachment_doc, :id, :script_id, :file_name
  json.url attachment_doc_url(attachment_doc, format: :json)
end
