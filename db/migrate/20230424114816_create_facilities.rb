class CreateFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facilities do |t|
      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :prefecture_id, null: false
      t.string :city
      t.string :facility_link
      t.string :place_link
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
