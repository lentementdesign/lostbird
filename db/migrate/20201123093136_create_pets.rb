class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :kind
      t.string :gender, null: false
      t.text :feature, null: false
      t.text :image, null: false
      t.boolean :lost, null: false, default: true
      t.date :find_day
      t.date :lost_day
      t.string :find_prefecture
      t.integer :prefecture, null: false, default: 0
      t.string :area
      t.string :place
      t.boolean :wanted, null: false, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
