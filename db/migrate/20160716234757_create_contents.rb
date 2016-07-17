class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.string :url
      t.string :category
      t.string :sentiment

      t.timestamps null: false
    end
  end
end
