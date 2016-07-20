class RemoveTimeSlotforUser < ActiveRecord::Migration
  def change
  	remove_column :users, :boozt_time_slot, :text, array: true, default: []
  end
end
