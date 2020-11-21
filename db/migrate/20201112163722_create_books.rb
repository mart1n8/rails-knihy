class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :original_name
      t.string :slug
      t.string :cover_img
      t.string :publish_year
      t.text :about
      t.references :user, null:false, foreign_key: true, default: 1
      t.timestamps
    end
  end
end
