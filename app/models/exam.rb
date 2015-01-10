class Exam < ActiveRecord::Base
  has_many :quesitons
  validates_presence_of :title, :text, :level, :points, :question1


end
