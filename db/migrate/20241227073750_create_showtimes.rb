class CreateShowtimes < ActiveRecord::Migration[7.2]
  def change
    create_table :showtimes do |t|
      t.bigint :movie_id, null: false
      t.bigint :screen_id, null: false
      t.timestamp :screening_time, null: false
      t.timestamps
    end
  end
end
