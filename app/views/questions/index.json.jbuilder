json.array!(@questions) do |question|
  json.extract! question, :id, :title, :text, :question1, :question2, :question3, :question4, :questionR
  json.url question_url(question, format: :json)
end
