class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.integer :number

      t.timestamps null: false
    end
  end
end
