class CreateBoozts < ActiveRecord::Migration
  def change
    create_table :boozts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :content, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
