json.array!(@exams) do |exam|
  json.extract! exam, :id, :title, :text, :level, :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10, :points
  json.url exam_url(exam, format: :json)
end
