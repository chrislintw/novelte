class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :novel, foreign_key: true
      t.integer :user_id
      t.string :title
      t.integer :rate
      t.text :content

      t.timestamps
    end
  end
end
