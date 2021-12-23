class CreateStages < ActiveRecord::Migration[5.2]
  def change
    create_table :stages do |t|
      t.references :actor, null: false
      t.string :title , null: false
      t.datetime :date , null: false
      t.integer :time , null: false
      t.string :text , null: false
      t.integer :status , default:1
      t.references :category, null: false

      t.timestamps
    end
  end
end
