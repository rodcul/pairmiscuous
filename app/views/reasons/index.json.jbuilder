json.array!(@reasons) do |reason|
  json.extract! reason, :id, :user_id, :pair_id, :reason
  json.url reason_url(reason, format: :json)
end
