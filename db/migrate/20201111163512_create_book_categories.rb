class CreateBookCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :book_categories do |t|
      t.string :title, null: false, uniqueness: true
      t.string :slug, null: false, uniqueness: true

      t.timestamps
    end
  end
end
