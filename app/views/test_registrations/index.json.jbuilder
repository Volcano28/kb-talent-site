json.array!(@test_registrations) do |test_registration|
  json.extract! test_registration, :id, :confirmed, :confirmation_status, :name
  json.url test_registration_url(test_registration, format: :json)
end
