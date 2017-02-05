class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :points
      t.integer :author_id
      t.integer :restaurant_id

      t.timestamps( null: false )
    end
  end
end
