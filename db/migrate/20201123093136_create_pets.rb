class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :kind, null: false
      t.string :lost_gender
      t.string :find_gender
      t.text :feature, null: false
      t.text :image, null: false
      t.integer :status, null: false, default: 1
      t.date :find_day
      t.date :lost_day
      t.integer :prefecture, null: false, default: 0
      t.string :place, null: false
      t.string :area
      t.float :latitude
      t.float :longitude
      t.boolean :wanted, null: false, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
