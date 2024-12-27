class CreateScreens < ActiveRecord::Migration[7.2]
  def change
    create_table "seats", force: :cascade do |t|
      t.bigint "screen_id", null: false
      t.string "seat_number"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end

  end
end
