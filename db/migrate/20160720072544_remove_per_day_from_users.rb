class RemovePerDayFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :boozts_per_day, :integer
  end
end
