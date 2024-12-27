class CreateScreens < ActiveRecord::Migration[7.2]
  def change
    create_table :screens do |t|
      t.integer :capacity, null: false
      t.timestamps
    end
  end
end
