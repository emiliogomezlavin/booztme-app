class AddAtributesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :boozts_per_day, :integer
  	add_column :users, :boozts_frequency, :string
  end
end
