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
                         { name: "冒険の始まり", schedule_start: "2024-01-10", schedule_end: "2024-01-30", screening_time: 120, subtitle: true, fee: 1300, appropriate_age: 7, created_at: Time.now, updated_at: Time.now, thumbnail: "movie1" },
                         { name: "霧の中の謎", schedule_start: "2024-01-15", schedule_end: "2024-02-10", screening_time: 110, subtitle: false, fee: 1500, appropriate_age: 12, created_at: Time.now, updated_at: Time.now, thumbnail: "movie2" },
                         { name: "銀河の戦士たち", schedule_start: "2024-02-01", schedule_end: "2024-02-28", screening_time: 150, subtitle: true, fee: 1800, appropriate_age: 15, created_at: Time.now, updated_at: Time.now, thumbnail: "movie3" },
                         { name: "夢の国の物語", schedule_start: "2024-01-20", schedule_end: "2024-02-25", screening_time: 140, subtitle: false, fee: 1700, appropriate_age: 7, created_at: Time.now, updated_at: Time.now, thumbnail: "movie4" },
                         { name: "最後の地平線", schedule_start: "2024-01-25", schedule_end: "2024-03-01", screening_time: 130, subtitle: true, fee: 1600, appropriate_age: 12, created_at: Time.now, updated_at: Time.now, thumbnail: "movie5" },
                         { name: "永遠の響き", schedule_start: "2024-02-05", schedule_end: "2024-03-05", screening_time: 125, subtitle: true, fee: 1500, appropriate_age: 15, created_at: Time.now, updated_at: Time.now, thumbnail: "movie6" },
                         { name: "隠された真実", schedule_start: "2024-02-10", schedule_end: "2024-03-15", screening_time: 100, subtitle: false, fee: 1400, appropriate_age: 12, created_at: Time.now, updated_at: Time.now, thumbnail: "movie7" },
                         { name: "谷の影", schedule_start: "2024-02-20", schedule_end: "2024-03-20", screening_time: 135, subtitle: true, fee: 1700, appropriate_age: 7, created_at: Time.now, updated_at: Time.now, thumbnail: "movie8" },
                         { name: "不死鳥の復活", schedule_start: "2024-03-01", schedule_end: "2024-03-25", screening_time: 145, subtitle: true, fee: 2000, appropriate_age: 15, created_at: Time.now, updated_at: Time.now, thumbnail: "movie9" },
                         { name: "忘れられた王国", schedule_start: "2024-03-10", schedule_end: "2024-04-01", screening_time: 120, subtitle: false, fee: 1200, appropriate_age: 7, created_at: Time.now, updated_at: Time.now, thumbnail: "movie10" }
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
