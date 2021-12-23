class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user , null: false
      t.references :stage , null: false

      t.timestamps
    end
  end
end
