json.array!(@questions) do |question|
  json.extract! question, :id, :branch, :level :text, :answer1, :answer2, :answer3, :answer4, :answerR
  json.url question_url(question, format: :json)
end
