json.array!(@ksat_lists) do |ksat_list|
  json.extract! ksat_list, :id, :title, :description
  json.url ksat_list_url(ksat_list, format: :json)
end
