class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :title, null: false
      t.integer :event_id, null: false
      t.references :facility, null: false, foreign_key: true
      t.timestamps
    end
  end
end
