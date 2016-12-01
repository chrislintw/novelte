class CreateNovels < ActiveRecord::Migration[5.0]
  def change
    create_table :novels do |t|
      t.string :title
      t.string :slug
      t.integer :chapters_number
      t.integer :rating
      t.text :summary
      t.string :image_fingerprint
      t.date :published_on
      t.date :end_on
      t.text :terms_and_conditions
      t.integer :chpaters_count, default: 0, null: false
      t.integer :current_chapter
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
