json.array!(@trainees) do |trainee|
  json.extract! trainee, :id, :lesson
  json.url trainee_url(trainee, format: :json)
end
