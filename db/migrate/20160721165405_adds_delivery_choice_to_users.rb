class AddsDeliveryChoiceToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :delivery_choice, :string
  end
end
