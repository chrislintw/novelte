class CreateTagsAndTaggings < ActiveRecord::Migration[5.0]
  def up
    create_table :tags do |t|
      t.string :name, null: false
    end

    create_table :taggings do |t|
      t.references :tag, foreign_key: true
      t.references :taggable, polymorphic: true
      t.timestamps
    end

  end

  def down
    drop_table :taggings
    drop_table :tags
  end
end
