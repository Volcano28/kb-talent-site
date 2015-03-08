json.array!(@registrations) do |registration|
  json.extract! registration, :id, :first_name, :last_name, :date_of_birth, :email, :phone_number, :video, :first_mp3, :second_mp3, :agreed_to_terms, :payment_confirmed
  json.url registration_url(registration, format: :json)
end
