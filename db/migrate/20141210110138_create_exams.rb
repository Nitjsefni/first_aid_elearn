class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.string :title
      t.text :text
      t.string :level
      t.text :question1
      t.text :question2
      t.text :question3
      t.text :question4
      t.text :question5
      t.text :question6
      t.text :question7
      t.text :question8
      t.text :question9
      t.text :question10
      t.integer :points

      t.timestamps
    end
  end
end
