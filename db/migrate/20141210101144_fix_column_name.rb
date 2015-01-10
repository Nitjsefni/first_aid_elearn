class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :questions, :title, :branch
  end
end
