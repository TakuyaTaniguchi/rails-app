# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# ユーザーの作成
User.find_or_create_by!(email: "test@example.com") do |user|
  user.family_name = "山田"
  user.first_name = "太郎"
  user.family_name_kana = "ヤマダ"
  user.first_name_kana = "タロウ"
  user.birthday = "1990-01-01"
  user.description = "テストユーザー"
  user.password_digest = BCrypt::Password.create("password")
end

# 映画の作成
movies = Movie.create!([
                         { name: "スターウォーズ", schedule_start: "2024-01-01", schedule_end: "2024-02-01", screening_time: 120, subtitle: true, fee: 1500, appropriate_age: 12 },
                         { name: "アバター", schedule_start: "2024-01-05", schedule_end: "2024-02-15", screening_time: 180, subtitle: false, fee: 1800, appropriate_age: 15 }
                       ])

# スクリーンの作成
screen = Screen.create!(capacity: 100)

# 座席を作成
rows = ('A'..'E').to_a
columns = (1..10).to_a
rows.each do |row|
  columns.each do |col|
    Seat.create!(screen: screen, seat_number: "#{row}#{col}")
  end
end


# 上映スケジュールの作成
Showtime.create!(
  movie: movies.first,
  screen: screen,
  screening_time: "2024-01-10 15:00:00"
)

# 予約情報の作成
Reservation.create!(
  user: User.first,
  showtime: Showtime.first,
  seat: Seat.first,
  reserved_at: Time.current
)
