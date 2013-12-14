json.array!(@case_managers) do |case_manager|
  json.extract! case_manager, :first_name, :last_name, :phone, :email
  json.url case_manager_url(case_manager, format: :json)
end
