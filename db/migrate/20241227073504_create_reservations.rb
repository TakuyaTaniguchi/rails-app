class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.bigint :user_id, null: false
      t.bigint :showtime_id, null: false
      t.bigint :seat_id, null: false
      t.timestamp :reserved_at, null: false
      t.timestamps
    end
  end
end
