class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :first_name, null:false
      t.string :last_name, null: false
      t.string :slug, null: false
      t.references :nation, null: true, foreign_key: true
      t.date :birth_day
      t.date :death_day
      t.string :birth_place
      t.string :death_place
      t.string :photo
      t.references :user, null:false, foreign_key: true, default: 1
      t.timestamps
    end
  end
end
