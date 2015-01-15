class Exam < ActiveRecord::Base
  has_many :questions
  validates_presence_of :title, :text, :level, :points


end
