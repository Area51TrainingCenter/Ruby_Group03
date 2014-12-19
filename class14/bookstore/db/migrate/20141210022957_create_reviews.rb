class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :author_name
      t.integer :rating
      t.text :content
      t.datetime :written_at
      t.integer :book_id

      t.timestamps
    end
  end
end
