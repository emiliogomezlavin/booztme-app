class AddsPerFrequencyToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :boozts_per_frequency, :integer
  end
end
