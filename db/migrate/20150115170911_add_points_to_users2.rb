class AddPointsToUsers2 < ActiveRecord::Migration
  def change
    add_column :users, :points, :integer
  end
end
