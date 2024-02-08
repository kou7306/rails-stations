# db/seeds.rb

# 映画がすでに存在することを前提として、映画のIDを指定します
movie_ids = [2, 15, 16]

# スケジュールを追加するためのサンプルデータ
schedules_data = [
  { movie_id: 2, start_time: '10:00', end_time: '12:00' },
  { movie_id: 15, start_time: '13:00', end_time: '15:00' },
  { movie_id: 16, start_time: '16:00', end_time: '18:00' }
]

# スケジュールを作成してデータベースに保存します
schedules_data.each do |schedule_data|
  Schedule.create(schedule_data)
end
