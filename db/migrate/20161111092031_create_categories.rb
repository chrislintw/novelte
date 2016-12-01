class CreateCategories < ActiveRecord::Migration[5.0]
  def up
    create_table :categories do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_table :categorizings do |t|
      t.references :category, index: true, foreign_key: true
      t.references :categorical, polymorphic: true

      t.timestamps null: false
    end

  end

  def down
    drop_table :categories
    drop_table :categorizings
  end
end
