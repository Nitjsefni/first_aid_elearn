class AddAnswersToExamAnswers < ActiveRecord::Migration
  def change
    add_column :exam_answers, :ans1, :text
    add_column :exam_answers, :ans2, :text
    add_column :exam_answers, :ans3, :text
    add_column :exam_answers, :ans4, :text
    add_column :exam_answers, :ans5, :text
    add_column :exam_answers, :ans6, :text
    add_column :exam_answers, :ans7, :text
    add_column :exam_answers, :ans8, :text
    add_column :exam_answers, :ans9, :text
    add_column :exam_answers, :ans10, :text
  end
end
