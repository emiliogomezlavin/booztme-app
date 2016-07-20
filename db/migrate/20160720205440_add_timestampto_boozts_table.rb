class AddTimestamptoBooztsTable < ActiveRecord::Migration
  def change
  	add_column :boozts, :timestamp, :time
  end
end
