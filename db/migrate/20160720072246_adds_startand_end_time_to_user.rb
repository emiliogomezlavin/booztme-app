class AddsStartandEndTimeToUser < ActiveRecord::Migration
  def change
  	add_column :users, :boozt_start, :integer
  	add_column :users, :boozt_end, :integer
  end
end
