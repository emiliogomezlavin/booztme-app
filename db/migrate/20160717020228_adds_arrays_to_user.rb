class AddsArraysToUser < ActiveRecord::Migration
  def change
  	add_column :users, :boozt_time_slot, :text, array: true, default: []
  	add_column :users, :random_boozt_time, :text, array: true, default: []
  end
end
