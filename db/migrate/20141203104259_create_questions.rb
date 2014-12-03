class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :text
      t.text :question1
      t.text :question2
      t.text :question3
      t.text :question4
      t.text :questionR

      t.timestamps
    end
  end
end
