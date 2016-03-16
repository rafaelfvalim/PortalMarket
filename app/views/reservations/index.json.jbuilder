json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :script_id, :owner_user_id, :reserve_for, :expiration_time
  json.url reservation_url(reservation, format: :json)
end
