class CreateUserProgresses < ActiveRecord::Migration
  def change
    create_table :user_progresses do |t|
      t.integer :user_id
      t.boolean :p1
      t.boolean :p2
      t.boolean :p3
      t.boolean :p4
      t.boolean :p5
      t.boolean :p6
      t.boolean :p7
      t.boolean :p8
      t.boolean :p9
      t.boolean :p10
      t.boolean :poczatkujacy
      t.boolean :z1
      t.boolean :z2
      t.boolean :z3
      t.boolean :z4
      t.boolean :z5
      t.boolean :z6
      t.boolean :z7
      t.boolean :z8
      t.boolean :z9
      t.boolean :z10
      t.boolean :zaawansowany

      t.timestamps
    end
  end
end
