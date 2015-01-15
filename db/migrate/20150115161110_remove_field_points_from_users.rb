class RemoveFieldPointsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :points, :integer
  end
end
