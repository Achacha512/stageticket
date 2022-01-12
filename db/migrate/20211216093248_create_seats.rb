class CreateSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :seats do |t|
      t.references :reservation
      t.references :stage , null: false
      t.string :seat_type , null: false
      t.integer :seat_price , null: false

      t.timestamps
    end
  end
end
