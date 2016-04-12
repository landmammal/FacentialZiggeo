json.array!(@coaches) do |coach|
  json.extract! coach, :id, :name, :email, :company, :field
  json.url coach_url(coach, format: :json)
end
