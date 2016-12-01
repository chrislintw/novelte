class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.references :novel, foreign_key: true, null: false
      t.references :author, null: false
      t.integer :chapter_num, null: false
      t.string :title, null: false
      t.text :outline
      t.text :contents
      t.datetime :contributed_at
      t.integer :previous_chapter_id
      t.integer :next_chapter_id
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
