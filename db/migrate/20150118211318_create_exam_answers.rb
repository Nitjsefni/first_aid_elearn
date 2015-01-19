class CreateExamAnswers < ActiveRecord::Migration
  def change
    create_table :exam_answers do |t|
      t.integer :exam_id
      t.integer :user_id
      t.boolean :q1
      t.boolean :q2
      t.boolean :q3
      t.boolean :q4
      t.boolean :q5
      t.boolean :q6
      t.boolean :q7
      t.boolean :q8
      t.boolean :q9
      t.boolean :q10
      t.integer :rec_points

      t.timestamps
    end
  end
end
