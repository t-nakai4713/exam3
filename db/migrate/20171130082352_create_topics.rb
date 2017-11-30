class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.text :content, null: false
      t.integer :user_id
      t.string  :image
      t.timestamps null: false
    end
  end
end
