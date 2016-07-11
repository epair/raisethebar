class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body, null: false
      t.string :rating, null: false
      t.string :price
      t.integer :user_id, null: false
      t.integer :bar_id, null: false
      t.timestamps  
    end
  end
end
