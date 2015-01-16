class Exam < ActiveRecord::Base
  has_many :questions
  validates_presence_of :title, :text, :level, :points, :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10


end
