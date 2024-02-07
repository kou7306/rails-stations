# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../config/environment'
# 映画データの配列を作成
movies = [
  { name: 'Star Wars', year: '1977', description: 'A long time ago in a galaxy far, far away...', image_url: 'https://placehold.jp/150x150.png', is_showing: true },
  { name: 'Lord of the Rings', year: '2001', description: 'One ring to rule them all...', image_url: 'https://placehold.jp/150x150.png', is_showing: true },
  # 他の映画データも追加可能
]

# 配列内の映画データをデータベースに挿入
movies.each do |movie_data|
  Movie.create!(movie_data)
end