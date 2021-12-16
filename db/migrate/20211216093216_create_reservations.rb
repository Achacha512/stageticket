class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.reference :user , null: false
      t.reference :stage , null: false

      t.timestamps
    end
  end
end
