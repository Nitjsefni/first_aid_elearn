class AddExamLevelToExamAnswer < ActiveRecord::Migration
  def change
    add_column :exam_answers, :exam_level, :text
  end
end
