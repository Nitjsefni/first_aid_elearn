class AddAllToUserProgresses < ActiveRecord::Migration
  def change
    add_column :user_progresses, :complete_all, :boolean
  end
end
