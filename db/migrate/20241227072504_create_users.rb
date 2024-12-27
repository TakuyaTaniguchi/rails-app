class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users, id: :uuid do |t|
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_name_kana, null: false
      t.string :first_name_kana, null: false
      t.date :birthday, null: false
      t.text :description
      t.string :email, null: false
      t.string :password_digest, null: false
      t.timestamp :deleted_at
      t.timestamps
    end

    # インデックスを追加して一意性を確保
    add_index :users, :email, unique: true
  end
end
