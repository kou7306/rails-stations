class Movie < ApplicationRecord

    # モデルの定義
    validates :name, uniqueness: true
end
  