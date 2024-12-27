class CreateSeats < ActiveRecord::Migration[7.2]
  def change
    create_table :seats do |t|
      t.bigint :screen_id, null: false
      t.string :seat_number, null: false
      t.timestamps
    end
  end
end
