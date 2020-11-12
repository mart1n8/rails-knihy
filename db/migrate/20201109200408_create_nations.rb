class CreateNations < ActiveRecord::Migration[6.0]
  def change
    create_table :nations do |t|
      t.string :title, null: false, unique: true
      t.string :slug, null: false, unique: true
      t.string :flag, null: false
    end
  end
end
