json.array!(@data_file_uploads) do |data_file_upload|
  json.extract! data_file_upload, :id
  json.url data_file_upload_url(data_file_upload, format: :json)
end
