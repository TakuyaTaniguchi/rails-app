class CreateMovies < ActiveRecord::Migration[7.2]
  def change
    create_table :movies do |t|
      t.string :name, null: false
      t.date :schedule_start, null: false
      t.date :schedule_end, null: false
      t.integer :screening_time, null: false
      t.boolean :subtitle, null: false, default: false
      t.integer :fee, null: false
      t.integer :appropriate_age, null: false
      t.timestamps
    end
  end
end
